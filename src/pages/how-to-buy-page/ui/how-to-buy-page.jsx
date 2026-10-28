import { Button } from '@/shared/ui/button';
import './how-to-buy-page.css';

export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ПОЛУЧАЕТЕ АДРЕС ДЛЯ ПОКУПОК', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step1.png' },
    { id: 2, title: 'ИДЕТЕ ЗА ПОКУПКАМИ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step2.png' },
    { id: 3, title: 'СЛЕДИТЕ ЗА ПЕРЕМЕЩЕНИЕМ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step3.png' },
    { id: 4, title: 'ОПЛАЧИВАЕТЕ ДОСТАВКУ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step4.png' },
    { id: 5, title: 'ПОЛУЧАЕТЕ ПОСЫЛКУ', desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', img: '/images/steps/step5.png' },
  ];
 
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Научим покупать в Великобритании!</h1>
        <p className="mt-4" style={{color: 'rgba(255,255,255,0.8)'}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <Button className="mt-4" onClick={() => alert('Функционал в разработке')}>Получить адрес в UK</Button>
      </div>
      
      <h2 className="title-h2 mb-8">Покупать в Великобритании очень просто</h2>
      <div className="how-to-grid">
        <div>
          <p className="text-muted mb-8">Английские магазины не доставляют в Россию, но это не проблема. С OkeyPost можно покупать по лучшим ценам и экономить до 70%.</p>
          <div className="steps-column">
            {steps.map(step => (
              <div key={step.id} className="how-step">
                <div className="step-num-block">
                  <span>0{step.id}</span>
                  <img src={step.img} className="step-thumb" onError={(e)=>e.target.style.display='none'}/>
                </div>
                <div><h4>{step.title}</h4><p className="text-muted">{step.desc}</p></div>
              </div>
            ))}
          </div>
        </div>
        <div className="sticky-illustration">
           <img src="/images/how-to-buy-illustration.png" style={{ width: '100%' }} onError={(e)=>e.target.style.display='none'} />
        </div>
      </div>

      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/viber.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
