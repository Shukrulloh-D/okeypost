export default function NotificationCard({ n }) {
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
      <h4>{n.title}</h4><p className="text-muted mt-4">{n.text}</p><span style={{fontSize:12, color:'#999', marginTop:8, display:'block'}}>{n.date}</span>
    </div>
  );
}
 