import React, { useState } from 'react';
import { Calendar, User, ArrowRight, Tag, Search, Sparkles } from 'lucide-react';

const BlogPage = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');

  const blogPosts = [
    {
      id: 1,
      title: "Introducing Cirquit: Quantum Computing for Developers",
      excerpt: "Today we're launching Cirquit v1.1.0 - a complete quantum computing platform built for developers who want to build quantum applications without the complexity.",
      author: "Tony Rossi",
      date: "October 9, 2025",
      category: "announcements",
      readTime: "5 min read",
      image: "🚀"
    },
    {
      id: 2,
      title: "Building Your First Quantum Circuit in 5 Minutes",
      excerpt: "Learn how to create your first quantum circuit, from installation to running your first Bell state. Perfect for beginners getting started with quantum computing.",
      author: "Tony Rossi",
      date: "October 10, 2025",
      category: "tutorials",
      readTime: "5 min read",
      image: "📚"
    },
    {
      id: 3,
      title: "How We Built a Quantum Simulator in Python",
      excerpt: "A deep dive into the architecture of Cirquit's statevector simulator. Learn about the technical decisions and optimizations that make it fast and accurate.",
      author: "Tony Rossi",
      date: "October 11, 2025",
      category: "technical",
      readTime: "12 min read",
      image: "⚙️"
    },
    {
      id: 4,
      title: "Quantum Algorithms Explained: Grover's Search",
      excerpt: "Understand Grover's algorithm and implement it in Cirquit. See how quantum computing can search unsorted databases quadratically faster than classical computers.",
      author: "Tony Rossi",
      date: "October 12, 2025",
      category: "algorithms",
      readTime: "10 min read",
      image: "🔍"
    },
    {
      id: 5,
      title: "Community Spotlight: Amazing Circuits from Our Users",
      excerpt: "This week we're featuring incredible quantum circuits created by the Cirquit community. From quantum games to optimization algorithms, see what people are building.",
      author: "Tony Rossi",
      date: "October 13, 2025",
      category: "community",
      readTime: "7 min read",
      image: "✨"
    }
  ];

  const categories = [
    { id: 'all', name: 'All Posts', count: blogPosts.length },
    { id: 'announcements', name: 'Announcements', count: 1 },
    { id: 'tutorials', name: 'Tutorials', count: 1 },
    { id: 'technical', name: 'Technical', count: 1 },
    { id: 'algorithms', name: 'Algorithms', count: 1 },
    { id: 'community', name: 'Community', count: 1 }
  ];

  const filteredPosts = blogPosts.filter(post => {
    const matchesSearch = post.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         post.excerpt.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesCategory = selectedCategory === 'all' || post.category === selectedCategory;
    return matchesSearch && matchesCategory;
  });

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-purple-950 to-slate-950">
      {/* Header */}
      <div className="border-b border-purple-500/20 bg-slate-950/50 backdrop-blur-sm">
        <div className="max-w-6xl mx-auto px-6 py-8">
          <div className="flex items-center gap-3 mb-4">
            <div className="w-10 h-10 bg-gradient-to-br from-purple-500 to-pink-500 rounded-lg flex items-center justify-center">
              <Sparkles className="w-6 h-6 text-white" />
            </div>
            <div>
              <h1 className="text-3xl font-bold text-white">Cirquit Blog</h1>
              <p className="text-purple-300">Quantum computing insights, tutorials, and updates</p>
            </div>
          </div>

          {/* Search */}
          <div className="relative max-w-xl">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-purple-400" />
            <input
              type="text"
              placeholder="Search articles..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full pl-12 pr-4 py-3 bg-slate-900/50 border border-purple-500/30 rounded-lg text-white placeholder-purple-400/50 focus:outline-none focus:border-purple-500/50"
            />
          </div>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-6 py-12">
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
          {/* Sidebar */}
          <div className="lg:col-span-1">
            <div className="sticky top-8 space-y-6">
              {/* Categories */}
              <div className="bg-slate-900/50 border border-purple-500/20 rounded-lg p-6">
                <h3 className="text-lg font-semibold text-white mb-4">Categories</h3>
                <div className="space-y-2">
                  {categories.map(category => (
                    <button
                      key={category.id}
                      onClick={() => setSelectedCategory(category.id)}
                      className={`w-full text-left px-3 py-2 rounded-lg transition-colors flex items-center justify-between ${
                        selectedCategory === category.id
                          ? 'bg-purple-500/20 text-purple-300'
                          : 'text-purple-400 hover:bg-purple-500/10'
                      }`}
                    >
                      <span>{category.name}</span>
                      <span className="text-xs bg-purple-500/20 px-2 py-1 rounded">{category.count}</span>
                    </button>
                  ))}
                </div>
              </div>

              {/* Newsletter */}
              <div className="bg-gradient-to-br from-purple-500/10 to-pink-500/10 border border-purple-500/20 rounded-lg p-6">
                <h3 className="text-lg font-semibold text-white mb-2">Newsletter</h3>
                <p className="text-sm text-purple-300 mb-4">Get weekly quantum computing insights</p>
                <input
                  type="email"
                  placeholder="your@email.com"
                  className="w-full px-3 py-2 bg-slate-900/50 border border-purple-500/30 rounded-lg text-white placeholder-purple-400/50 text-sm mb-3 focus:outline-none focus:border-purple-500/50"
                />
                <button className="w-full bg-gradient-to-r from-purple-500 to-pink-500 text-white py-2 rounded-lg text-sm font-medium hover:from-purple-600 hover:to-pink-600 transition-all">
                  Subscribe
                </button>
              </div>
            </div>
          </div>

          {/* Blog Posts */}
          <div className="lg:col-span-3 space-y-6">
            {filteredPosts.length === 0 ? (
              <div className="text-center py-12">
                <p className="text-purple-400">No posts found matching your search.</p>
              </div>
            ) : (
              filteredPosts.map(post => (
                <article
                  key={post.id}
                  className="bg-slate-900/50 border border-purple-500/20 rounded-lg p-6 hover:border-purple-500/40 transition-all group"
                >
                  <div className="flex items-start gap-4">
                    <div className="text-4xl">{post.image}</div>
                    <div className="flex-1">
                      <div className="flex items-center gap-3 mb-3">
                        <span className="px-3 py-1 bg-purple-500/20 text-purple-300 text-xs font-medium rounded-full">
                          {post.category}
                        </span>
                        <span className="text-purple-400/60 text-sm">{post.readTime}</span>
                      </div>

                      <h2 className="text-2xl font-bold text-white mb-3 group-hover:text-purple-300 transition-colors">
                        {post.title}
                      </h2>

                      <p className="text-purple-300/80 mb-4 leading-relaxed">
                        {post.excerpt}
                      </p>

                      <div className="flex items-center justify-between">
                        <div className="flex items-center gap-4 text-sm text-purple-400/60">
                          <div className="flex items-center gap-2">
                            <User className="w-4 h-4" />
                            <span>{post.author}</span>
                          </div>
                          <div className="flex items-center gap-2">
                            <Calendar className="w-4 h-4" />
                            <span>{post.date}</span>
                          </div>
                        </div>

                        <button className="flex items-center gap-2 text-purple-400 hover:text-purple-300 transition-colors group">
                          <span className="text-sm font-medium">Read More</span>
                          <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                        </button>
                      </div>
                    </div>
                  </div>
                </article>
              ))
            )}

            {/* Pagination */}
            {filteredPosts.length > 0 && (
              <div className="flex items-center justify-center gap-2 pt-6">
                <button className="px-4 py-2 bg-slate-900/50 border border-purple-500/20 text-purple-400 rounded-lg hover:border-purple-500/40 transition-colors">
                  Previous
                </button>
                <button className="px-4 py-2 bg-purple-500/20 border border-purple-500/40 text-purple-300 rounded-lg font-medium">
                  1
                </button>
                <button className="px-4 py-2 bg-slate-900/50 border border-purple-500/20 text-purple-400 rounded-lg hover:border-purple-500/40 transition-colors">
                  2
                </button>
                <button className="px-4 py-2 bg-slate-900/50 border border-purple-500/20 text-purple-400 rounded-lg hover:border-purple-500/40 transition-colors">
                  3
                </button>
                <button className="px-4 py-2 bg-slate-900/50 border border-purple-500/20 text-purple-400 rounded-lg hover:border-purple-500/40 transition-colors">
                  Next
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default BlogPage;