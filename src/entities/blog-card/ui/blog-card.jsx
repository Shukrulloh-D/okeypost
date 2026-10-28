export default function BlogCard({ post }) {
  return <div style={{ background: '#fff', borderRadius: '16px', overflow: 'hidden', border: '1px solid var(--border)', cursor: 'pointer' }}><img src={post.img} style={{width:'100%', height: 200, objectFit:'cover', background: '#eee'}}/><div style={{padding:24}}><h3 style={{fontSize: 18, lineHeight:1.4, marginBottom:16}}>{post.title}</h3><div style={{display:'flex', justifyContent:'space-between', color:'var(--text-muted)', fontSize:13}}><span>{post.date}</span><span>{post.cat}</span></div></div></div>;
}
 