import { Button } from '@/shared/ui/button';
import { Calculator } from '@/features/calculator';
import { mockCategories, mockDeliveryOptions, mockReviews } from '@/shared/mock/data';
import { Star } from 'lucide-react';

export default function HomePage() {
  return (
    <div>
      {/* HERO */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center'}}>
          <div><h1 style={{fontSize: 48}}>Доставка товаров из Великобритании в Россию</h1><p className="mt-4">Начните экономить до 80% на шоппинге.</p><Button className="mt-8" style={{background:'#fff', color:'var(--primary-purple)'}}>Получить адрес в UK</Button></div>
          <img src="/images/hero.png" style={{height: 300}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
      
      {/* КАТЕГОРИИ */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-4">Насколько выгодно покупать?</h2>
        <div style={{display:'flex', justifyContent:'space-between', background:'#fff', padding:32, borderRadius:24, border: '1px solid var(--border)'}}>
          {mockCategories.map(c=><div key={c.id} style={{display:'flex', flexDirection:'column', alignItems:'center', gap:16}}><img src={c.img} style={{width:48, height:48}} onError={(e)=>e.target.style.display='none'}/><span>{c.name}</span></div>)}
        </div>
      </div>
      
      {/* КУРТКА */}
      <div className="container mt-8">
        <div style={{display:'flex', justifyContent:'space-between', alignItems:'center', background:'#fff', padding:60, borderRadius:36, border: '1px solid var(--border)'}}>
          <div style={{flex: 1}}>
            <h3 style={{fontSize:24}}>Columbia Barlow Pass 550 Turbodown Jacket</h3>
            <div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16, alignItems: 'center', width: 'fit-content'}}><img src="/images/icons/flag-ru.png" style={{width: 32}} onError={(e)=>e.target.style.display='none'}/><div><p className="text-muted" style={{fontSize:12}}>Цена в России</p><b>7891,46₽</b></div></div>
          </div>
          <div style={{flex: 1, display: 'flex', justifyContent: 'center', position: 'relative'}}>
            <img src="/images/jacket.png" style={{maxWidth:'100%', height: 300}} onError={(e)=>e.target.style.display='none'}/>
          </div>
          <div style={{flex: 1, textAlign:'right'}}>
            <h3 style={{fontSize:24}}>Доставка одежды из Великобритании <span style={{color:'var(--primary-green)'}}>от £7.79</span></h3>
            <div className="mt-4" style={{display:'flex', gap:16, background:'#F5F7FA', padding:16, borderRadius:16, justifyContent:'flex-end', alignItems: 'center', width: 'fit-content', marginLeft: 'auto'}}><div><p className="text-muted" style={{fontSize:12}}>Цена в UK</p><b>£80.62</b></div><img src="/images/icons/flag-uk.png" style={{width: 32}} onError={(e)=>e.target.style.display='none'}/></div>
          </div>
        </div>
        <div style={{display: 'flex', justifyContent: 'space-between', padding: '0 60px', marginTop: 24}}>
          <img src="/images/icons/tshirt.png" style={{height: 80}} onError={(e)=>e.target.style.display='none'}/>
          <p className="text-muted" style={{textAlign: 'center'}}>Срок доставки примерно 10 дней<br/><b style={{color: '#1A1A1A', fontSize: 18}}>Вы экономите до <span style={{color: 'var(--primary-green)'}}>$119.56</span></b></p>
          <img src="/images/icons/jeans.png" style={{height: 80}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>

      {/* БЛОК МАСТЕРОВ (Пропущенный) */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', alignItems:'center', padding: 40, gap: 40}}>
          <img src="/images/master.png" style={{height: 200}} onError={(e)=>e.target.style.display='none'}/>
          <div>
            <h2 style={{color: '#fff', fontSize: 28}}>Поручите нашим мастерам оформление заказов в английских магазинах</h2>
            <p style={{color: 'rgba(255,255,255,0.8)', marginTop: 12, marginBottom: 24}}>Такой способ покупки также подойдет, если магазин принимает только английские карты.</p>
            <Button style={{background: 'var(--primary-green)'}}>Попробовать</Button>
          </div>
        </div>
      </div>

      {/* КАЛЬКУЛЯТОР */}
      <div className="container mt-8">
        <h2 className="title-h2">OkeyPost удобная и быстрая доставка посылок</h2>
        <Calculator />
      </div>
      
      {/* ВАРИАНТЫ ДОСТАВКИ */}
      <div className="container mt-8">
        <h3 className="title-h2 mb-4" style={{fontSize:24}}>Варианты доставки:</h3>
        <div style={{background:'#fff', borderRadius:16, border:'1px solid var(--border)'}}>
          {mockDeliveryOptions.map(o=><div key={o.id} style={{display:'flex', padding:24, borderBottom:'1px solid var(--border)'}}><div style={{flex:2, display:'flex', gap:16, alignItems: 'center'}}><img src={o.img} style={{width:32}} onError={(e)=>e.target.style.display='none'}/><b>{o.name}</b></div><div style={{flex:1}}>Сроки: {o.days}</div><div style={{flex:1}}>Стоимость: {o.cost}</div><div style={{flex:1}}>Итого: {o.total}</div></div>)}
        </div>
      </div>

      {/* 4 ПРОСТЫХ ШАГА (Пропущенный) */}
      <div className="container mt-8">
        <h2 className="title-h2 mb-8">4 простых шага для ваших покупок в Великобритании</h2>
        <div style={{display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24}}>
          {[1, 2, 3, 4].map(i => (
             <div key={i}>
               <img src={`/images/steps/step${i}.png`} style={{height: 150, objectFit: 'contain', display: 'block', margin: '0 auto'}} onError={(e)=>e.target.style.display='none'}/>
               <h4 style={{fontSize: 14, textTransform: 'uppercase', marginTop: 24, marginBottom: 8, fontWeight: 700}}>Шаг {i}</h4>
               <p className="text-muted" style={{fontSize: 13}}>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
             </div>
          ))}
        </div>
      </div>

      {/* ВИРТУАЛЬНЫЙ ТУР */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', alignItems:'center', padding: 40, gap: 40}}>
          <img src="/images/virtual-tour.png" style={{height: 150}} onError={(e)=>e.target.style.display='none'}/>
          <div><h2 style={{color:'#fff'}}>Виртуальный тур по нашему складу</h2><p style={{color:'rgba(255,255,255,0.8)'}} className="mt-4">Вы можете всегда посмотреть на нашу слаженную работу.</p><Button className="mt-4" style={{background:'var(--primary-green)'}}>Попробовать</Button></div>
        </div>
      </div>

      {/* ОТЗЫВЫ */}
      <div className="container mt-8">
        <h2 className="title-h2">120 000 довольных клиентов в России</h2>
        <div style={{display:'grid', gridTemplateColumns:'1fr 1fr', gap:24, marginTop: 24}}>
          {mockReviews.map(r=><div key={r.id} style={{background:'#fff', padding:24, borderRadius:16, display:'flex', gap:16, border: '1px solid var(--border)'}}><img src={r.img} style={{width:100, height:100, borderRadius:12}} onError={(e)=>e.target.style.background='#eee'}/><div><h4>{r.name}</h4><div style={{color:'#FFB800', display: 'flex'}}>{[...Array(r.stars)].map((_, i) => <Star key={i} size={14} fill="#FFB800" />)}</div><p className="text-muted mt-4" style={{fontSize:14}}>{r.text}</p><span style={{fontSize:12, color:'#999', marginTop: 12, display:'block'}}>Дата: {r.date} <br/> Город: {r.city}</span></div></div>)}
        </div>
      </div>

      {/* ЛИЧНЫЙ АДРЕС (Пропущенный) */}
      <div className="container mt-8" style={{maxWidth: 900}}>
        <h2 className="title-h2 mb-4">Ваш личный адрес в Великобритании для покупок</h2>
        <p className="text-muted" style={{lineHeight: 1.8, marginBottom: 16}}>С нами вы получаете целых два адреса в UK! У нас есть два склада для приема посылок – в Лондоне и Манчестере.</p>
        <p className="text-muted" style={{lineHeight: 1.8, marginBottom: 16}}>При доставке из UK в Россию все ваши товары обязательно страхуются. Прием посылок на наш склад, их обработка, удаление лишних коробок, хранение сроком до 70 дней – у нас полностью бесплатно.</p>
        <p className="text-muted" style={{lineHeight: 1.8}}>У нас самая выгодная доставка! От $11.99 за посылку! А если у вас есть какие-то особенные требования, вроде проверки техники или дополнительной пленки для самых хрупких товаров, – операторы нашего склада с радостью выполнят их по спецзапросу.</p>
      </div>

      {/* ПОДПИСКА */}
      <div className="container mt-8">
        <div className="bg-blue-gradient" style={{display:'flex', justifyContent:'space-between', alignItems:'center', padding:40}}>
          <h2 style={{color:'#fff', maxWidth:600}}>Подпишитесь и будьте в курсе всех скидок и акций магазинов Великобритании!</h2>
          <div style={{display:'flex', gap:16}}>
            <input type="text" placeholder="Введите ваш email" style={{padding:16, borderRadius:8, border:'none', width: 250}}/>
            <Button style={{background:'var(--primary-green)'}}>Подписаться</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
