import { AuthForm } from '@/features/auth';
import { useLocation } from 'react-router-dom';
export default function AuthPage() { const isReg = useLocation().pathname === '/register'; return <div className="container page-wrapper"><AuthForm isRegister={isReg} /></div>; }
