import { mockStores } from '@/shared/mock/data';
import './stores-page.css';

export default function StoresPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Популярные магазины</h1></div>
      
      <div className="stores-grid">
        {mockStores.map((store, i) => (
          <div key={i} className="store-card">
            <img src={store.img} className="store-logo" onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}}/>
            <span className="store-fallback" style={{display: 'none'}}>{store.name}</span>
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
