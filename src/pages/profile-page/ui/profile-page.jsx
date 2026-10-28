import { Outlet, useNavigate } from 'react-router-dom';
import { ProfileSidebar } from '@/widgets/profile-sidebar';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
export default function ProfilePage() {
  const { logout, user } = useAuthStore();
  const navigate = useNavigate();
  return (
    <div className="container page-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ display: 'flex', justifyContent: 'space-between', padding: '20px 40px', borderRadius: 16 }}><span>{user?.name || 'Dmitro Karlov'}</span><Button onClick={() => { logout(); navigate('/'); }}>Выйти</Button></div>
      <div style={{ display: 'flex', gap: 24 }}><ProfileSidebar /><div style={{ flex: 1, background: '#fff', padding: 32, borderRadius: 16, border: '1px solid var(--border)' }}><Outlet /></div></div>
    </div>
  );
}
