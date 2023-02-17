// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.17.0

package db

import (
	"database/sql"
)

type Account struct {
	ID        int32        `json:"id"`
	Owner     string       `json:"owner"`
	Balance   interface{}  `json:"balance"`
	Currency  string       `json:"currency"`
	CreatedAt sql.NullTime `json:"created_at"`
}

type Entry struct {
	ID        int32 `json:"id"`
	AccountID int32 `json:"account_id"`
	// can be negative or postive
	Amount    int32        `json:"amount"`
	CreatedAt sql.NullTime `json:"created_at"`
}

type Transfer struct {
	ID            int32        `json:"id"`
	FromAccountID int32        `json:"from_account_id"`
	ToAccountID   int32        `json:"to_account_id"`
	Amount        interface{}  `json:"amount"`
	CreatedAt     sql.NullTime `json:"created_at"`
}
