import { mockBlog } from '@/shared/mock/data';
import { BlogCard } from '@/entities/blog-card';

export default function BlogPage() {
  
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Блог</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '32px' }}>
        {mockBlog.map(post => <BlogCard key={post.id} post={post} />)}
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
 