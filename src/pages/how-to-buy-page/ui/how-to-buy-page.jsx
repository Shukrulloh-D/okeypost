import { Button } from '@/shared/ui/button';
export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ПОЛУЧАЕТЕ АДРЕС ДЛЯ ПОКУПОК', desc: 'Зарегистрируйтесь на сайте и получите адрес склада в Великобритании.', img: '/images/steps/step1.png' },
    { id: 2, title: 'ИДЕТЕ ЗА ПОКУПКАМИ', desc: 'Выбираете товары в английских магазинах, оплачиваете и указываете адрес склада.', img: '/images/steps/step2.png' },
    { id: 3, title: 'СЛЕДИТЕ ЗА ПЕРЕМЕЩЕНИЕМ', desc: 'Отслеживайте статус посылки в личном кабинете.', img: '/images/steps/step3.png' },
    { id: 4, title: 'ОПЛАЧИВАЕТЕ ДОСТАВКУ', desc: 'Выбираете способ доставки из UK в Россию и оплачиваете.', img: '/images/steps/step4.png' },
    { id: 5, title: 'ПОЛУЧАЕТЕ ПОСЫЛКУ', desc: 'Забираете посылку в пункте выдачи или ждете курьера.', img: '/images/steps/step5.png' },
  ];
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Научим покупать в Великобритании!</h1><Button className="mt-4" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button></div>
      <h2 className="title-h2 mb-8">Покупать в Великобритании очень просто</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '60px' }}>
        <div>
          <p className="text-muted mb-8">Английские магазины не доставляют в Россию, но это не проблема. С OkeyPost можно покупать по лучшим ценам и экономить до 70%.</p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '40px' }}>
            {steps.map(step => (
              <div key={step.id} style={{ display: 'flex', gap: '24px' }}>
                <div style={{ color: 'var(--primary-green)', fontSize: '36px', fontWeight: 700, opacity: 0.5 }}>0{step.id}</div>
                <div><h4 style={{ fontSize: '16px', fontWeight: 700, marginBottom: '8px' }}>{step.title}</h4><p className="text-muted" style={{ fontSize: '14px' }}>{step.desc}</p></div>
              </div>
            ))}
          </div>
        </div>
        <div style={{ position: 'relative' }}>
           <img src="/images/how-to-buy-illustration.png" style={{ width: '100%', position: 'sticky', top: '100px' }} onError={(e)=>e.target.style.display='none'} />
        </div>
      </div>
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h2 style={{ color: '#fff', fontSize: '28px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
      </div>
    </div>
  );
}
