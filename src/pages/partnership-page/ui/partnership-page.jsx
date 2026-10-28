import { Button } from '@/shared/ui/button';
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1>
        <p className="mt-4">Платим $3 с каждой отправленной посылки</p>
        <Button className="mt-4" style={{ background: 'rgba(255,255,255,0.2)' }}>Начать зарабатывать</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px', marginBottom: '48px' }}>
        {[1,2,3,4,5].map(i => (
          <div key={i} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)', display: 'flex', gap: '20px' }}>
            <img src={`/images/icons/bonus${i}.png`} style={{width: 40, height: 40}} onError={(e)=>e.target.style.display='none'}/>
            <div>
              <h3 style={{ fontSize: '18px', marginBottom: '12px' }}>Дарим около 10% назад бонусами</h3>
              <p className="text-muted" style={{ fontSize: '14px' }}>Копите бонусы и тратьте их на следующие покупки.</p>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient" style={{ padding: '60px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div style={{display: 'flex', alignItems: 'center', gap: 40}}>
          <img src="/images/bonus-illustration.png" style={{height: 150}} onError={(e)=>e.target.style.display='none'}/>
          <div>
            <h2 style={{ color: '#fff', fontSize: '28px' }}>Готовы начать зарабатывать вместе с нами?</h2>
            <p style={{ color: 'rgba(255,255,255,0.8)', marginTop: '8px' }}>Присоединяйтесь к партнерской программе OkeyPost.com уже сегодня.</p>
            <Button style={{ background: 'var(--primary-green)', marginTop: '24px' }}>Присоединиться</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
