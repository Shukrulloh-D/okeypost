import { Calculator } from '@/features/calculator';
import { mockDeliveryOptions } from '@/shared/mock/data';
import { Check } from 'lucide-react';
export default function PricesPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Услуги доставки из Великобритании</h1>
        <p className="mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
      
      {/* 4 карточки услуг */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24, marginBottom: 48 }}>
        {[1,2,3,4].map(i => (
          <div key={i} style={{ background: '#fff', padding: 24, borderRadius: 16, border: '1px solid var(--border)' }}>
            <img src={`/images/icons/service${i}.png`} style={{height: 100, marginBottom: 20}} onError={(e)=>e.target.style.display='none'}/>
            <h3 style={{fontSize: 18, marginBottom: 12}}>Услуга {i}</h3>
            <p className="text-muted" style={{fontSize: 14}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <Button className="mt-4" variant="outline" style={{width: '100%'}}>Подробнее</Button>
          </div>
        ))}
      </div>

      <h2 className="title-h2 mb-4">Онлайн-калькулятор стоимости доставки товара</h2>
      <p className="text-muted mb-4">Задайте необходимые параметры посылки, и калькулятор рассчитает приблизительную стоимость.</p>
      <Calculator />
      
      <h2 className="title-h2 mt-8 mb-4">Варианты доставки:</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
        {mockDeliveryOptions.map(o => (
          <div key={o.id} style={{ display: 'flex', padding: 24, borderBottom: '1px solid var(--border)', alignItems: 'center' }}>
            <div style={{ flex: 2, display: 'flex', gap: 16, alignItems: 'center' }}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Сроки:</span><br/><b>{o.days}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Стоимость:</span><br/><b>{o.cost}</b></div>
            <div style={{ flex: 1 }}><span className="text-muted" style={{fontSize:12}}>Итого:</span><br/><b>{o.total}</b></div>
            <Check color="var(--primary-green)" />
          </div>
        ))}
      </div>

      <h2 className="title-h2 mt-8 mb-4">Услуги склада</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Консолидация</span><b>£1.00 / шт</b></div>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Заполнение декларации</span><b>£5.00</b></div>
         <div style={{ padding: 24, borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Дополнительная упаковка</span><b>£3.00</b></div>
         <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Упаковка хрупких предметов</span><b>£10.00</b></div>
      </div>

      {/* Блок оператора */}
      <div className="bg-blue-gradient" style={{ display: 'flex', alignItems: 'center', gap: 40, padding: 40, borderRadius: 24, marginBottom: 48 }}>
        <img src="/images/operator.png" style={{height: 200}} onError={(e)=>e.target.style.display='none'}/>
        <div>
          <h2 style={{color: '#fff', fontSize: 28}}>Попробуйте заказывать с оператором прямо сейчас.</h2>
          <p style={{color: 'rgba(255,255,255,0.8)', marginTop: 12, marginBottom: 24}}>Пришлите ссылку на товар, его купят и доставят на наш склад в кратчайшие сроки.</p>
          <div style={{display: 'flex', gap: 16}}>
            <input type="text" placeholder="Введите ссылку на товар" style={{padding: '12px 16px', borderRadius: 8, border: 'none', width: 300}}/>
            <Button style={{background: 'var(--primary-green)'}}>Отправить</Button>
          </div>
        </div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Страхование</h2>
      <div style={{ background: '#fff', borderRadius: 16, border: '1px solid var(--border)', marginBottom: 48 }}>
        <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Дополнительное страхование</span><span className="text-muted">5% от суммы, на которую хотите застраховать</span></div>
        <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Почта России и ЕМС</span><span className="text-muted">Застраховано по умолчанию на £50.00</span></div>
        <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Мелкие пакеты</span><span className="text-muted">Застраховано на £20.00</span></div>
      </div>

      <h2 className="title-h2 mt-8 mb-4">Дополнительная упаковка</h2>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 0, background: '#fff', borderRadius: 16, border: '1px solid var(--border)' }}>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Многослойная пленка</span><b>£1.99</b></div>
         <div style={{ padding: 24, borderBottom: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Упаковка в пакет</span><b>£1.99</b></div>
         <div style={{ padding: 24, borderRight: '1px solid var(--border)', display: 'flex', justifyContent: 'space-between' }}><span>Упаковка в коробку с двойными стенками</span><b>£4.99</b></div>
         <div style={{ padding: 24, display: 'flex', justifyContent: 'space-between' }}><span>Наклейка "Обращаться с осторожностью"</span><b>£0.25</b></div>
      </div>

    </div>
  );
}
