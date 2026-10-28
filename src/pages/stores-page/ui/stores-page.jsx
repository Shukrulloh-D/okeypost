import { mockStores } from '@/shared/mock/data';
export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Популярные магазины</h1></div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: '24px' }}>
        {mockStores.map((store, i) => (
          <div key={i} style={{ background: '#fff', height: '120px', borderRadius: '16px', display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)' }}><span style={{ fontWeight: 700, color: '#ccc' }}>{store}</span></div>
        ))}
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderRadius: '24px' }}><h2 style={{ color: '#fff' }}>Остались вопросы? Спросите нас в соцсетях!</h2></div>
    </div>
  );
}
