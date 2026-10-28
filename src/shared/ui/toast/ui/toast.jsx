import { create } from 'zustand';
import { CheckCircle, XCircle, X } from 'lucide-react';
import './toast.css';

export const useToastStore = create((set) => ({
  toasts: [],
  addToast: (message, type = 'success') => {
    const id = Date.now();
    set((state) => ({ toasts: [...state.toasts, { id, message, type }] }));
    setTimeout(() => {
      set((state) => ({ toasts: state.toasts.filter((t) => t.id !== id) }));
    }, 3000);
  },
  removeToast: (id) => set((state) => ({ toasts: state.toasts.filter((t) => t.id !== id) })),
}));

export const ToastContainer = () => {
  const { toasts, removeToast } = useToastStore();
  return (
    <div className="toast-container">
      {toasts.map((toast) => (
        <div key={toast.id} className={`toast toast-${toast.type}`}>
          {toast.type === 'success' ? <CheckCircle size={20} /> : <XCircle size={20} />}
          <span>{toast.message}</span>
          <button onClick={() => removeToast(toast.id)}><X size={16} /></button>
        </div>
      ))}
    </div>
  );
};
