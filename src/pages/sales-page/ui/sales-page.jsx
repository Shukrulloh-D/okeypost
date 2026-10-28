import { mockSales } from '@/shared/mock/data';
import { Button } from '@/shared/ui/button';
export default function SalesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}><h1 style={{ fontSize: '32px' }}>Распродажи</h1><p className="mt-4">Ранний доступ к распродажам в магазинах</p><Button className="mt-4" style={{ background: 'rgba(255,255,255,0.2)' }}>Получить адрес в UK</Button></div>
      <h2 className="title-h2 mb-8">Black Friday Early Access<br/>ранний доступ к распродажам в магазинах Великобритании!</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '40px' }}>
        {mockSales.map(item => (
          <div key={item.id} style={{ background: '#fff', padding: '24px', borderRadius: '16px', display: 'flex', gap: '24px', border: '1px solid var(--border)' }}>
            <img src={item.img} alt={item.shop} style={{ width: '180px', height: '180px', objectFit: 'cover', borderRadius: '12px', background: '#eee' }} onError={(e) => e.target.style.background='#ddd'} />
            <div style={{ flex: 1 }}><h3 style={{ fontSize: '20px', marginBottom: '12px' }}>{item.shop}</h3><p className="text-muted mb-4" style={{ fontSize: '14px' }}>{item.desc}</p><a href="#" style={{ color: 'var(--primary-blue)', fontSize: '14px', fontWeight: 500 }}>Товары в магазине →</a></div>
          </div>
        ))}
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
