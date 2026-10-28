export default function OrderRow({ order }) {
  return (
    <tr style={{ borderBottom: '1px solid var(--border)' }}>
      <td style={{ padding: '16px' }}>#{order.id}</td><td>{order.date}</td><td>{order.track}</td><td>{order.sum}</td>
      <td><span style={{ background: '#E6F7FF', color: 'var(--primary-blue)', padding: '4px 12px', borderRadius: '12px', fontSize: '12px' }}>{order.status}</span></td>
    </tr>
  );
}
 