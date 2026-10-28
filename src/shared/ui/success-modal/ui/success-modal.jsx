import { CheckCircle, X } from 'lucide-react';
import './success-modal.css';

export const SuccessModal = ({ isOpen, onClose, title, message }) => {
  if (!isOpen) return null;
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="success-modal" onClick={(e) => e.stopPropagation()}>
        <button className="success-close" onClick={onClose}><X size={20} /></button>
        <CheckCircle size={64} color="#10B981" />
        <h3 className="title-h2 mt-4">{title || 'Успешно!'}</h3>
        <p className="text-muted mt-4">{message || 'Операция выполнена успешно.'}</p>
        <button className="btn btn-primary mt-8" onClick={onClose} style={{minWidth: 150}}>Закрыть</button>
      </div>
    </div>
  );
};
