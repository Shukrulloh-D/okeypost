import { mockSales } from '@/shared/mock/data';
import { Button } from '@/shared/ui/button';
import './sales-page.css';

export default function SalesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Распродажи</h1>
        <p className="mt-4" style={{color: 'rgba(255,255,255,0.8)'}}>Ранний доступ к распродажам в магазинах</p>
        <Button className="mt-4" onClick={() => alert('Получение адреса')}>Получить адрес в UK</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Black Friday Early Access<br/>ранний доступ к распродажам в магазинах Великобритании!</h2>
      
      <div className="sales-grid">
        {mockSales.map(item => (
          <div key={item.id} className="sale-card">
            <img src={item.img} className="sale-img" onError={(e) => e.target.style.background='#ddd'} />
            <div className="sale-info">
              <h3>{item.shop}</h3>
              <p className="text-muted mt-4">{item.desc}</p>
              <p className="text-muted mt-4" style={{fontSize: 12}}>{item.info}</p>
              <a href="#" className="sale-link">Товары в магазине →</a>
            </div>
          </div>
        ))}
      </div>
 
      <div className="bg-blue-gradient mt-8 cta-bottom">
        <h2>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
