#!/bin/bash
echo "📦 Обновляем Layout, Header и Footer..."

# 1. Расширяем контейнер и улучшаем базовые стили
cat > src/app/styles/global.css << 'END'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --bg-main: #F5F7FA; --bg-card: #FFFFFF;
  --primary-blue: #40B8EA; --primary-purple: #5B52A3; --primary-green: #00B33B;
  --text-main: #1A1A1A; --text-muted: #8A8A8A; --border: #E0E0E0;
  --font: 'Inter', sans-serif;
}
* { box-sizing: border-box; margin: 0; padding: 0; }
body { background: var(--bg-main); font-family: var(--font); color: var(--text-main); -webkit-font-smoothing: antialiased; }
a { text-decoration: none; color: inherit; }
ul { list-style: none; }
button { cursor: pointer; font-family: inherit; border: none; background: none; }

/* Увеличили контейнер для десктопа как в Figma */
.container { max-width: 1440px; margin: 0 auto; padding: 0 48px; }
.text-center { text-align: center; }
.mt-4 { margin-top: 16px; } .mt-8 { margin-top: 32px; } .mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 32px; }
.title-h1 { font-size: 40px; font-weight: 700; }
.title-h2 { font-size: 28px; font-weight: 700; }
.text-muted { color: var(--text-muted); font-size: 14px; }
.page-wrapper { padding-top: 40px; padding-bottom: 80px; min-height: 70vh; }
@media (max-width: 1024px) { .container { padding: 0 24px; } }
END

# 2. Полноценный Header
cat > src/widgets/header/ui/header.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User, Search, Menu } from 'lucide-react';
import './header.css';

export default function Header() {
  const isAuth = useAuthStore((state) => state.isAuth);

  return (
    <header className="header">
      <div className="container header-container">
        {/* Логотип */}
        <Link to="/" className="logo">
          <img src="/images/logo.png" alt="OkeyPost" style={{height: 36}} onError={(e) => {e.target.style.display='none'; e.target.nextSibling.style.display='block'}} />
          <span style={{display: 'none', fontSize: '24px', fontWeight: 800, color: 'var(--primary-blue)'}}>OkeyPost</span>
        </Link>

        {/* Навигация */}
        <nav className="nav">
           <Link to="/how-to-buy">Как покупать</Link>
           <Link to="/sales">Распродажи</Link>
           <Link to="/prices">Цены</Link>
           <Link to="/faq">Помощь</Link>
           <Link to="/blog">Блог</Link>
           <Link to="/stores">Магазины</Link>
        </nav>

        {/* Действия */}
        <div className="header-actions">
          <button className="icon-btn"><Search size={20} /></button>
          {isAuth ? (
            <Link to="/profile" className="icon-btn"><User size={20} /> Профиль</Link>
          ) : (
            <Link to="/login" className="icon-btn"><User size={20} /> Войти</Link>
          )}
          {isAuth && (
            <Link to="/create-parcel">
              <Button className="desktop-btn">Создать посылку</Button>
            </Link>
          )}
        </div>
      </div>
    </header>
  );
}
END

cat > src/widgets/header/ui/header.css << 'END'
.header { background: #fff; border-bottom: 1px solid var(--border); padding: 16px 0; position: sticky; top: 0; z-index: 100; }
.header-container { display: flex; justify-content: space-between; align-items: center; }
.logo { display: flex; align-items: center; }
.nav { display: flex; gap: 28px; font-size: 14px; font-weight: 500; color: var(--text-muted); }
.nav a:hover { color: var(--primary-blue); }
.header-actions { display: flex; align-items: center; gap: 20px; }
.icon-btn { display: flex; align-items: center; gap: 8px; font-size: 14px; color: var(--text-main); font-weight: 500; transition: 0.2s; }
.icon-btn:hover { color: var(--primary-blue); }
.desktop-btn { padding: 10px 20px; }
@media (max-width: 1024px) { .nav { display: none; } }
END

# 3. Полноценный Footer
cat > src/widgets/footer/ui/footer.jsx << 'END'
import { Link } from 'react-router-dom';
import { Globe, MessageCircle } from 'lucide-react';
import './footer.css';

export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-container">
        <div className="footer-col brand">
          <h2 style={{color: 'var(--primary-blue)', fontWeight: 800}}>OkeyPost</h2>
          <div className="socials">
            <Globe size={20} />
            <MessageCircle size={20} />
          </div>
        </div>
        <div className="footer-col">
          <h4>О компании</h4>
          <Link to="/">Как купить</Link>
          <Link to="/">Как оплатить</Link>
          <Link to="/">Доставка</Link>
          <Link to="/">Контакты</Link>
        </div>
        <div className="footer-col">
          <h4>Полезное</h4>
          <Link to="/">Партнерская программа</Link>
          <Link to="/">Бонусы и скидки</Link>
          <Link to="/">Отзывы</Link>
          <Link to="/">Вопрос-ответ</Link>
        </div>
        <div className="footer-col">
          <h4>Справочная</h4>
          <Link to="/">Служба поддержки</Link>
          <Link to="/">Пользовательское соглашение</Link>
          <Link to="/">Политика конфиденциальности</Link>
        </div>
      </div>
      <div className="container footer-bottom">
        <p>© 2022 OkeyPost. Все права защищены.</p>
      </div>
    </footer>
  );
}
END

cat > src/widgets/footer/ui/footer.css << 'END'
.footer { background: #fff; border-top: 1px solid var(--border); padding: 60px 0 20px; margin-top: auto; }
.footer-container { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 40px; }
.footer-col h4 { font-size: 16px; margin-bottom: 20px; }
.footer-col a { display: block; color: var(--text-muted); font-size: 14px; margin-bottom: 12px; transition: 0.2s; }
.footer-col a:hover { color: var(--primary-blue); }
.socials { display: flex; gap: 16px; margin-top: 20px; color: var(--text-muted); }
.footer-bottom { text-align: center; color: var(--text-muted); font-size: 12px; padding-top: 20px; border-top: 1px solid var(--border); }
@media (max-width: 768px) { .footer-container { grid-template-columns: 1fr; gap: 30px; } }
END

echo "✅ Layout, Header и Footer обновлены!"
