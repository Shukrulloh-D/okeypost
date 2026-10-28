import { Button } from '@/shared/ui/button';
import './partnership-page.css';

export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1>
        <p className="mt-4">Платим $3 с каждой отправленной посылки</p>
        <Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Начать зарабатывать</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div className="bonus-grid">
        {[1,2,3,4,5].map(i => (
          <div key={i} className="bonus-card">
            <img src={`/images/icons/bonus${i}.png`} className="bonus-icon" onError={(e)=>e.target.style.display='none'}/>
            <div>
              <h3>Дарим около 10% назад бонусами</h3>
              <p className="text-muted mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
            </div>
          </div>
        ))}
      </div>
 
      <div className="bg-blue-gradient cta-banner">
        <img src="/images/bonus-illustration.png" className="cta-img" onError={(e)=>e.target.style.display='none'}/>
        <div>
          <h2>Готовы начать зарабатывать вместе с нами?</h2>
          <p className="mt-4">Присоединяйтесь к партнерской программе OkeyPost.com уже сегодня.</p>
          <Button className="mt-8" onClick={() => alert('Регистрация партнера')}>Присоединиться</Button>
        </div>
      </div>
    </div>
  );
}
