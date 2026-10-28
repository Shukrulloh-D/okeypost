import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { useAuthStore } from '@/shared/store/auth-store';
import { User } from 'lucide-react';
export default function Header() {
  const isAuth = useAuthStore((s) => s.isAuth);
  return (
    <header style={{ background: '#fff', borderBottom: '1px solid var(--border)', padding: '16px 0', position: 'sticky', top: 0, zIndex: 100 }}>
      <div className="container" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Link to="/" style={{ fontSize: 24, fontWeight: 800, color: 'var(--primary-blue)' }}>OkeyPost</Link>
        <nav style={{ display: 'flex', gap: 24, fontSize: 14 }}>
           <Link to="/how-to-buy">Как покупать</Link><Link to="/sales">Распродажи</Link><Link to="/prices">Цены</Link><Link to="/faq">Помощь</Link><Link to="/partnership">Бонусы</Link><Link to="/blog">Блог</Link><Link to="/stores">Магазины</Link>
        </nav>
        <div style={{ display: 'flex', gap: 20, alignItems: 'center' }}>
          {isAuth ? <Link to="/profile"><User size={20}/></Link> : <Link to="/login"><User size={20}/> Вход</Link>}
          <Link to={isAuth ? "/create-parcel" : "/login"}><Button>Создать посылку</Button></Link>
        </div>
      </div>
    </header>
  );
}
