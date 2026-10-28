#!/bin/bash
echo "🚀 ЗАПОЛНЯЕМ ВСЕ СТРАНИЦЫ РЕАЛЬНЫМ КОНТЕНТОМ (По скринам Figma)..."

# ==========================================
# 1. СТРАНИЦА "КАК ПОКУПАТЬ" (Скрин 02)
# ==========================================
cat > src/pages/how-to-buy-page/ui/how-to-buy-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function HowToBuyPage() {
  const steps = [
    { id: 1, title: 'ВЫ ВЫБИРАЕТЕ ТОВАР', desc: 'В английском магазине, оплачиваете и указываете адрес склада OkeyPost.', img: '/images/steps/1.png' },
    { id: 2, title: 'ПОКУПКИ ПРИХОДЯТ НА СКЛАД', desc: 'И появляются в вашем личном кабинете на нашем сайте.', img: '/images/steps/2.png' },
    { id: 3, title: 'ОТПРАВЛЯЕМ ИХ К ВАМ ДОМОЙ', desc: 'В надежной упаковке, по выгодной цене и очень быстро.', img: '/images/steps/3.png' },
    { id: 4, title: 'ЗАБИРАЕТЕ СВОЮ ПОСЫЛКУ', desc: 'В пункте выдачи, на почте или с курьером.', img: '/images/steps/4.png' },
  ];

  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}>
        <h1 style={{ fontSize: '28px' }}>Научит покупать в Великобритании!</h1>
        <Button className="mt-4" style={{ background: '#fff', color: 'var(--primary-purple)' }}>Получить адрес в UK</Button>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '60px', alignItems: 'center' }}>
        <div>
          <h2 className="title-h2 mb-4">Покупать в Великобритании очень просто</h2>
          <p className="text-muted mb-8">Английские магазины в большинстве случаев не работают с Россией. Поэтому мы создали для вас сервис, который помогает покупать в Англии и доставляет товары до вашей двери.</p>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '32px' }}>
            {steps.map(step => (
              <div key={step.id} style={{ display: 'flex', gap: '24px' }}>
                <div style={{ color: 'var(--primary-green)', fontSize: '36px', fontWeight: 700, opacity: 0.5 }}>0{step.id}</div>
                <div>
                  <h4 style={{ fontSize: '16px', fontWeight: 700, marginBottom: '8px' }}>{step.title}</h4>
                  <p className="text-muted" style={{ fontSize: '14px' }}>{step.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
        
        <div style={{ background: '#fff', padding: '40px', borderRadius: '24px', border: '1px solid var(--border)' }}>
          <img src="/images/hero-illustration.png" alt="How to buy" style={{ width: '100%', borderRadius: '16px' }} onError={(e) => e.target.style.display='none'} />
          <div style={{ display: 'flex', gap: '16px', marginTop: '32px' }}>
            <Button style={{ width: '100%' }}>Быстрая покупка</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as HowToBuyPage } from './ui/how-to-buy-page';" > src/pages/how-to-buy-page/index.js

# ==========================================
# 2. СТРАНИЦА "РАСПРОДАЖИ" (Скрин 03)
# ==========================================
cat > src/pages/sales-page/ui/sales-page.jsx << 'END'
export default function SalesPage() {
  const sales = [
    { id: 1, shop: 'Abercrombie & Fitch', desc: 'Скидки до 50%', img: '/images/sales/1.png' },
    { id: 2, shop: 'Polo Ralph Lauren', desc: 'Скидки до 40%', img: '/images/sales/2.png' },
    { id: 3, shop: 'Michael Kors', desc: 'Black Friday Early Access', img: '/images/sales/3.png' },
    { id: 4, shop: "Victoria's Secret", desc: 'Скидки на комплекты', img: '/images/sales/4.png' },
    { id: 5, shop: 'Timberland', desc: 'Новая коллекция со скидкой', img: '/images/sales/5.png' },
    { id: 6, shop: 'Hollister Co.', desc: 'Скидки до 50%', img: '/images/sales/6.png' },
  ];

  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Распродажи</h1>
        <p className="mt-4">Ранний доступ к распродажам в магазинах</p>
      </div>

      <h2 className="title-h2 mb-8">Black Friday Early Access<br/>ранний доступ к распродажам в магазинах Великобритании!</h2>
      
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '40px' }}>
        {sales.map(item => (
          <div key={item.id} style={{ background: '#fff', padding: '24px', borderRadius: '16px', display: 'flex', gap: '24px', border: '1px solid var(--border)' }}>
            <img src={item.img} alt={item.shop} style={{ width: '180px', height: '180px', objectFit: 'cover', borderRadius: '12px', background: '#eee' }} onError={(e) => e.target.style.background='#ddd'} />
            <div style={{ flex: 1 }}>
              <h3 style={{ fontSize: '20px', marginBottom: '12px' }}>{item.shop}</h3>
              <p className="text-muted mb-4" style={{ fontSize: '14px' }}>{item.desc}</p>
              <a href="#" style={{ color: 'var(--primary-blue)', fontSize: '14px', fontWeight: 500 }}>Товары в магазине →</a>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
END
echo "export { default as SalesPage } from './ui/sales-page';" > src/pages/sales-page/index.js

# ==========================================
# 3. СТРАНИЦА "БЛОГ" (Скрин 07)
# ==========================================
cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
import { mockBlog } from '@/shared/mock/data';

export default function BlogPage() {
  // Расширим моковые данные прямо тут для полноты
  const posts = [
    { id: 1, title: 'Интернет-магазин Urban Outfitters в UK: обзор', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/1.png' },
    { id: 2, title: 'Overstock. Брендовые товары по доступным ценам', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/2.png' },
    { id: 3, title: 'Sneakers и Amazon. Удобная обувь для всей семьи', date: '22.10.2021', cat: 'Обувь', img: '/images/blog/3.png' },
    { id: 4, title: '16 лучших подарков с Amazon в 2021 году', date: '22.10.2021', cat: 'Разное', img: '/images/blog/4.png' },
    { id: 5, title: 'Target — семейный супермаркет с ценами от 300 рублей', date: '22.10.2021', cat: 'Разное', img: '/images/blog/5.png' },
    { id: 6, title: 'Английский магазин RIPDIR. Покупаем с выгодой', date: '22.10.2021', cat: 'Одежда', img: '/images/blog/6.png' },
  ];

  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}>
        <h1 style={{ fontSize: '28px' }}>Блог</h1>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '32px' }}>
        {posts.map(post => (
          <div key={post.id} style={{ background: '#fff', borderRadius: '16px', overflow: 'hidden', border: '1px solid var(--border)', cursor: 'pointer' }}>
            <img src={post.img} alt={post.title} style={{ width: '100%', height: '220px', objectFit: 'cover', background: '#eee' }} onError={(e) => e.target.style.background='#ddd'} />
            <div style={{ padding: '24px' }}>
              <h3 style={{ fontSize: '18px', lineHeight: 1.4, marginBottom: '16px' }}>{post.title}</h3>
              <div style={{ display: 'flex', justifyContent: 'space-between', color: 'var(--text-muted)', fontSize: '13px' }}>
                <span>{post.date}</span>
                <span>{post.cat}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

# ==========================================
# 4. СТРАНИЦА "МАГАЗИНЫ" (Скрин 08)
# ==========================================
cat > src/pages/stores-page/ui/stores-page.jsx << 'END'
export default function StoresPage() {
  const stores = ['PRIMARK', 'H&M', 'MANGO', 'Next', 'Sports Direct', 'F&F', 'Accessorize', 'Adidas', 'Amazon', 'ASOS', 'Boohoo', 'Crocs', 'eBay', 'Matalan', 'Mothercare', 'New Look', 'Puma', 'Timberland', 'ZARA'];
  
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}>
        <h1 style={{ fontSize: '28px' }}>Популярные магазины</h1>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(6, 1fr)', gap: '24px' }}>
        {stores.map((store, i) => (
          <div key={i} style={{ background: '#fff', height: '120px', borderRadius: '16px', display: 'flex', alignItems: 'center', justifyContent: 'center', border: '1px solid var(--border)', cursor: 'pointer', transition: '0.2s' }}>
            <span style={{ fontWeight: 700, color: '#ccc', textTransform: 'uppercase' }}>{store}</span>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderRadius: '24px' }}>
        <h2 style={{ color: '#fff', fontSize: '24px' }}>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{ display: 'flex', gap: '16px' }}>
          <div style={{ width: '40px', height: '40px', background: 'rgba(255,255,255,0.2)', borderRadius: '50%' }}></div>
          <div style={{ width: '40px', height: '40px', background: 'rgba(255,255,255,0.2)', borderRadius: '50%' }}></div>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as StoresPage } from './ui/stores-page';" > src/pages/stores-page/index.js

# ==========================================
# 5. ПАРТНЕРСКАЯ ПРОГРАММА (Скрин 06)
# ==========================================
cat > src/pages/partnership-page/ui/partnership-page.jsx << 'END'
import { Button } from '@/shared/ui/button';
export default function PartnershipPage() {
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '40px' }}>
        <h1 style={{ fontSize: '32px' }}>Бонусы и партнерская программа</h1>
        <p className="mt-4">Платим $3 с каждой отправленной посылки</p>
        <Button className="mt-4" style={{ background: 'rgba(255,255,255,0.2)', border: '1px solid #fff' }}>Начать зарабатывать</Button>
      </div>

      <h2 className="title-h2 mb-8">Зарабатывать с нами — проще простого:</h2>
      
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px', marginBottom: '40px' }}>
        {[
          { t: 'Дарим около 10% назад бонусами', d: 'Копите бонусы и тратьте их на следующие покупки.' },
          { t: 'Платим по $3 за отправленную посылку', d: 'Приглашайте друзей и получайте вознаграждение.' },
          { t: 'Призы по итогам', d: 'Участвуйте в розыгрышах и получайте призы.' },
          { t: 'Выплаты на карту', d: 'Выводите заработанные деньги на карту или счет.' },
          { t: 'Повышенный кэшбэк', d: 'Получайте повышенный кэшбэк с крупных заказов.' }
        ].map((item, i) => (
          <div key={i} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)' }}>
            <h3 style={{ fontSize: '18px', marginBottom: '12px' }}>{item.t}</h3>
            <p className="text-muted" style={{ fontSize: '14px' }}>{item.d}</p>
          </div>
        ))}
      </div>

      <div className="bg-blue-gradient" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div>
          <h2 style={{ color: '#fff', fontSize: '28px' }}>Готовы начать зарабатывать вместе с нами?</h2>
          <p style={{ color: 'rgba(255,255,255,0.8)', marginTop: '8px' }}>Присоединяйтесь к партнерской программе OkeyPost.com уже сегодня.</p>
        </div>
        <Button style={{ background: '#fff', color: 'var(--primary-purple)' }}>Присоединиться</Button>
      </div>
    </div>
  );
}
END
echo "export { default as PartnershipPage } from './ui/partnership-page';" > src/pages/partnership-page/index.js

# ==========================================
# 6. ПРОФИЛЬ: РЕКВИЗИТЫ И АДРЕСА (Скрины 13, 14, 24)
# ==========================================
cat > src/pages/profile-page/ui/payment-tab/payment-tab.jsx << 'END'
export default function PaymentTab() {
  return (
    <div>
      <h3 className="mb-8" style={{ fontSize: '20px' }}>Реквизиты для оплаты</h3>
      
      <div style={{ display: 'grid', gap: '24px' }}>
        <div>
          <h4 style={{ marginBottom: '8px' }}>Pay24</h4>
          <div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display: 'flex', justifyContent: 'space-between' }}>
            <span>Номер кошелька</span> <span className="text-muted">4405XXXXXXXXX</span>
          </div>
        </div>

        <div>
          <h4 style={{ marginBottom: '8px' }}>PayPal</h4>
          <div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display: 'flex', justifyContent: 'space-between' }}>
            <span>Email</span> <span className="text-muted">test@okeypost.com</span>
          </div>
        </div>

        <div>
          <h4 style={{ marginBottom: '8px' }}>Unistream</h4>
          <div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display: 'flex', flexDirection: 'column', gap: '8px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between' }}><span>Name</span> <span className="text-muted">Dmitro Karlov</span></div>
            <div style={{ display: 'flex', justifyContent: 'space-between' }}><span>Tel</span> <span className="text-muted">+44 20 7946 0958</span></div>
          </div>
        </div>

        <div>
          <h4 style={{ marginBottom: '8px' }}>SWIFT</h4>
          <div style={{ background: '#F5F7FA', padding: '16px', borderRadius: '8px', display: 'flex', flexDirection: 'column', gap: '8px', fontSize: '14px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between' }}><span>IBAN</span> <span className="text-muted">GB29 NWBK 6016 1331 9268 19</span></div>
            <div style={{ display: 'flex', justifyContent: 'space-between' }}><span>Банк</span> <span className="text-muted">National Westminster Bank</span></div>
          </div>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as PaymentTab } from './payment-tab';" > src/pages/profile-page/ui/payment-tab/index.js

cat > src/pages/address-book-page/ui/address-book-page.jsx << 'END'
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { useForm } from 'react-hook-form';

export default function AddressBookPage() {
  const { register, handleSubmit } = useForm();

  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Адресная книга пользователя</h1>
      
      <form onSubmit={handleSubmit((d) => alert('Адрес сохранен'))} style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)' }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
          <Input label="Фамилия" register={register('surname')} />
          <Input label="Имя" register={register('name')} />
          <Input label="Область/регион" register={register('region')} />
          <Input label="Район" register={register('district')} />
          <Input label="Город" register={register('city')} />
          <Input label="Улица" register={register('street')} />
          <Input label="Дом" register={register('house')} />
          <Input label="Квартира" register={register('flat')} />
          <Input label="Индекс" register={register('index')} />
          <Input label="Телефон" register={register('phone')} />
        </div>
        <Button type="submit" className="mt-8">Сохранить</Button>
      </form>
    </div>
  );
}
END
echo "export { default as AddressBookPage } from './ui/address-book-page';" > src/pages/address-book-page/index.js

# ==========================================
# 7. ПРОФИЛЬ: УВЕДОМЛЕНИЯ (Скрин 25)
# ==========================================
cat > src/pages/notifications-page/ui/notifications-page.jsx << 'END'
import { NotificationCard } from '@/entities/notification-card';
import { mockNotifications } from '@/shared/mock/data';
import { AlertTriangle } from 'lucide-react';

export default function NotificationsPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Уведомления</h1>
      
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
        {mockNotifications.map(n => <NotificationCard key={n.id} n={n} />)}
        <NotificationCard n={{ id: 3, title: 'Как оформить декларацию в тарифах', date: '25 Ноября', text: 'Совершенно не важно, какой у вас тариф.' }} />
        <NotificationCard n={{ id: 4, title: '3 дня выкупов БЕСПЛАТНО', date: '25 Ноября', text: 'Уважаемые клиенты! С 6 по 8 ноября.' }} />
      </div>

      <div style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)', marginTop: '32px', display: 'flex', gap: '24px', alignItems: 'flex-start' }}>
        <div style={{ background: '#FFFBEB', padding: '12px', borderRadius: '50%', color: '#D97706' }}><AlertTriangle size={24} /></div>
        <div>
          <h3 style={{ fontSize: '18px', marginBottom: '8px' }}>Про таможенные лимиты:</h3>
          <p className="text-muted" style={{ fontSize: '14px', lineHeight: 1.6 }}>С 1 января 2020 года беспошлинный лимит в России составляет 200 евро. В то же время, если посылка не превышает этот лимит, она не облагается налогом.</p>
          <p className="text-muted" style={{ fontSize: '14px', lineHeight: 1.6, marginTop: '8px' }}>При превышении беспошлинного порога необходимо оплатить пошлину в размере 15% от суммы превышения.</p>
          <button className="btn btn-primary mt-4">Подробнее</button>
        </div>
      </div>
    </div>
  );
}
END
echo "export { default as NotificationsPage } from './ui/notifications-page';" > src/pages/notifications-page/index.js

# ==========================================
# 8. ОБНОВЛЯЕМ MOCK DATA (Чтобы везде были данные)
# ==========================================
cat > src/shared/mock/data.js << 'END'
export const mockCategories = [
  { id: 1, name: 'Одежда', img: '/images/icons/clothes.png' }, { id: 2, name: 'Электроника', img: '/images/icons/laptop.png' },
  { id: 3, name: 'Аксессуары', img: '/images/icons/bag.png' }, { id: 4, name: 'Для детей', img: '/images/icons/baby.png' },
  { id: 5, name: 'Для спорта', img: '/images/icons/sport.png' }, { id: 6, name: 'Косметика', img: '/images/icons/cosmetics.png' },
];
export const mockDeliveryOptions = [
  { id: 1, name: 'ПОЧТА РОССИИ', days: '10-14 дней', cost: 'от £27.00', total: '£41.99', img: '/images/icons/post.png' },
  { id: 2, name: 'EMS ПОЧТА РОССИИ', days: '9-12 дней', cost: 'от £40.00', total: '£54.55', img: '/images/icons/ems.png' },
  { id: 3, name: 'ПОЧТА РОССИИ МЕЛКИЕ ПАКЕТЫ', days: '10-14 дней', cost: 'от £13.00', total: '£30.50', img: '/images/icons/package.png' },
];
export const mockReviews = [
  { id: 1, name: 'NIKOLAY S', stars: 5, text: 'Ваша доставка самая быстрая и дешёвая!!!', date: '16 Ноября 2021', city: 'Санкт-Петербург', img: '/images/reviews/1.png' },
  { id: 2, name: 'DMITRIY D', stars: 5, text: 'Пуховик Levi\'s с eBay. Всё приехало быстро и целым.', date: '16 Ноября 2021', city: 'Москва', img: '/images/reviews/2.png' },
];
export const mockOrders = [
  { id: '12345', date: '15.10.2022', track: 'UK123456789', sum: '12 450 ₽', status: 'В пути' },
  { id: '12346', date: '18.10.2022', track: 'UK987654321', sum: '5 200 ₽', status: 'На складе' },
  { id: '12347', date: '20.10.2022', track: 'UK111222333', sum: '34 100 ₽', status: 'Доставлен' },
];
export const mockNotifications = [
  { id: 1, title: 'На складе в четверг 25 ноября выходной!', date: '25 Ноября', text: 'Уважаемые клиенты! Сообщаем вам...' },
  { id: 2, title: 'Выкуплен БЕСПЛАТНО с промокодом BF2021', date: '25 Ноября', text: 'Уважаемые клиенты! С 20.11...' },
];
export const mockFaq = [
  { category: 'Виртуальный адрес', items: [ { id: 1, q: 'Как узнать, что заказ пришел?', a: 'Вам придет SMS.' }, { id: 2, q: 'Сколько стоит адрес?', a: 'Бесплатно.' } ]},
  { category: 'Покупки в Англии', items: [ { id: 3, q: 'Анонс скидок', a: 'В нашем блоге.' }, { id: 4, q: 'Как оплатить?', a: 'Картой или PayPal.' } ]},
];
END

# ==========================================
# 9. МЕЛКИЕ ПРАВКИ ДЛЯ КРАСОТЫ
# ==========================================
# Добавляем стиль для карточек уведомлений в CSS
cat > src/entities/notification-card/ui/notification-card.css << 'END'
.notification-card { background: #fff; padding: 24px; border-radius: 12px; border: 1px solid var(--border); display: flex; flex-direction: column; justify-content: space-between; }
.notification-card h4 { font-size: 16px; margin-bottom: 8px; }
.notification-card p { font-size: 14px; color: var(--text-muted); line-height: 1.5; }
END

# Обновляем компонент NotificationCard, чтобы он использовал CSS
cat > src/entities/notification-card/ui/notification-card.jsx << 'END'
import './notification-card.css';
export default function NotificationCard({ n }) {
  return (
    <div className="notification-card">
      <div>
        <h4>{n.title}</h4>
        <p className="mt-4">{n.text}</p>
      </div>
      <span style={{fontSize:12, color:'#999', marginTop:16, display:'block'}}>{n.date}</span>
    </div>
  );
}
END

echo "✅ ВСЁ ГОТОВО! Все страницы заполнены контентом по макетам."
