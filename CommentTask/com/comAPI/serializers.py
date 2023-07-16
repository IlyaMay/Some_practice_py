from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Post, Category, Comment
from mptt.templatetags.mptt_tags import cache_tree_children
from django.conf import settings

class PostSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    comments = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    category = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    def get_comments(self, post):
        comments = cache_tree_children(
            Comment.objects.filter(
                post=post, level__lte=settings.MAX_DEPTH - 1))
        serializer = CommentSerializer(
            comments,
            many=True,
            context=self.context)
        return serializer.data
    class Meta:
        model = Post
        fields = ['id', 'title', 'category', 'text', 'owner', 'comments', 'time_created']



class CommentSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    children = serializers.SerializerMethodField()

    def get_children(self, comment):
        max_depth = settings.MAX_DEPTH
        comment_level = int(self.context.get('depth_level', 0))
        max_depth += comment_level
        if comment.get_level() >= max_depth:
            return []
        children = comment.get_children()
        return CommentSerializer(
            children, many=True, context=self.context).data

    class Meta:
        model = Comment
        fields = ['id','text', 'post', 'parent', 'owner', 'children']


class CategorySerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    posts = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = Category
        fields = ['id', 'title', 'owner', 'posts']


class UserSerializer(serializers.ModelSerializer):
    posts = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'posts',]

        
