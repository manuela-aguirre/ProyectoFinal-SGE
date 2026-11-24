<style>
    .cotec-content > header h2 {
        color: #0f172a;
        font-size: 1.35rem;
        font-weight: 700;
        line-height: 1.35;
    }

    .cotec-main .bg-white.shadow {
        border: 1px solid rgba(20, 83, 45, 0.1);
        border-radius: 1rem;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.05);
    }

    .cotec-main table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        border-radius: 0.9rem;
        background: #fff;
        font-size: 0.875rem;
    }

    .cotec-main table th {
        padding: 0.8rem 1rem;
        border-bottom: 1px solid #e2e8f0;
        background: #f8fafc;
        color: #475569;
        font-size: 0.68rem;
        font-weight: 700;
        letter-spacing: 0.07em;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .cotec-main table td {
        padding: 0.8rem 1rem;
        border-bottom: 1px solid #f1f5f9;
        color: #334155;
        vertical-align: top;
    }

    .cotec-main table tbody tr:last-child td {
        border-bottom: 0;
    }

    .cotec-main table tbody tr:hover {
        background: #f8fafc;
    }

    .cotec-main input:not([type="checkbox"]):not([type="radio"]):not([type="hidden"]),
    .cotec-main select,
    .cotec-main textarea {
        border: 1px solid #cbd5e1;
        border-radius: 0.65rem;
        background-color: #fff;
        color: #0f172a;
        padding: 0.6rem 0.8rem;
        transition: border-color 0.15s ease, box-shadow 0.15s ease;
    }

    .cotec-main input:focus,
    .cotec-main select:focus,
    .cotec-main textarea:focus {
        border-color: #15803d;
        outline: 0;
        box-shadow: 0 0 0 3px rgba(21, 128, 61, 0.15);
    }

    .cotec-main input[type="checkbox"],
    .cotec-main input[type="radio"] {
        accent-color: #15803d;
    }

    .crud-wrap {
        padding: 1.5rem;
    }

    .crud-toolbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 1rem;
        flex-wrap: wrap;
        margin-bottom: 1.25rem;
    }

    .crud-search {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0.5rem;
    }

    .crud-search input {
        min-width: 16rem;
    }

    .crud-btn-new {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.65rem 1rem;
        border-radius: 0.65rem;
        background: #14532d;
        color: white;
        font-size: 0.85rem;
        font-weight: 600;
        text-decoration: none;
        transition: background 0.15s ease, transform 0.15s ease;
    }

    .crud-btn-new:hover {
        background: #166534;
        transform: translateY(-1px);
    }

    .crud-btn-new:focus-visible {
        outline: 2px solid #14532d;
        outline-offset: 2px;
    }

    .crud-badge {
        border-radius: 999px;
        background: #f0fdf4;
        color: #14532d;
        padding: 0.2rem 0.6rem;
        font-size: 0.72rem;
        font-weight: 600;
    }

    .crud-badge.warn {
        background: #fef3c7;
        color: #92400e;
    }

    .crud-actions a,
    .crud-actions button {
        margin-right: 0.75rem;
        font-size: 0.78rem;
        font-weight: 600;
        text-decoration: none;
    }

    .crud-actions a.edit,
    .crud-actions button.pay {
        border: 0;
        background: none;
        color: #14532d;
        cursor: pointer;
        padding: 0;
    }

    .crud-actions button.delete {
        border: 0;
        background: none;
        color: #b91c1c;
        cursor: pointer;
        padding: 0;
    }

    .status-banner {
        margin-bottom: 1rem;
        border: 1px solid #a7f3d0;
        border-radius: 0.75rem;
        background: #ecfdf5;
        color: #14532d;
        padding: 0.85rem 1rem;
        font-size: 0.88rem;
        font-weight: 600;
    }

    .status-banner.error {
        border-color: #fecaca;
        background: #fef2f2;
        color: #991b1b;
    }

    .empty-state {
        border: 1px dashed #cbd5e1;
        border-radius: 0.9rem;
        background: #f8fafc;
        color: #64748b;
        padding: 3rem 1rem;
        text-align: center;
    }

    .crud-form {
        max-width: 48rem;
    }

    .crud-form .field {
        margin-bottom: 1.1rem;
    }

    .crud-form label {
        color: #334155;
        font-size: 0.85rem;
        font-weight: 600;
    }

    .crud-form .grid-2 {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 1rem;
    }

    .crud-form .actions {
        display: flex;
        gap: 0.75rem;
        margin-top: 1.5rem;
    }

    .crud-form .btn-cancel {
        border-radius: 0.65rem;
        background: #f1f5f9;
        color: #475569;
        padding: 0.65rem 1rem;
        font-size: 0.85rem;
        font-weight: 600;
        text-decoration: none;
    }

    @media (max-width: 640px) {
        .crud-wrap {
            padding: 1rem;
        }

        .crud-search {
            width: 100%;
        }

        .crud-search input {
            width: 100%;
            min-width: 0;
        }

        .cotec-main table th,
        .cotec-main table td {
            padding: 0.65rem 0.7rem;
        }

        .crud-form .grid-2 {
            grid-template-columns: 1fr;
        }
    }
</style>
