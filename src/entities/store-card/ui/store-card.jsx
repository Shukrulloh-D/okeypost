export default function StoreCard({ store }) {
  return <div style={{ background: '#fff', borderRadius: 16, height: 120, display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)' }}><img src={store.logo} alt={store.name} style={{maxHeight: 40}} onError={(e) => e.target.style.display='none'}/></div>;
}
