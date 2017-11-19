(require 'mu4e)

;; default
(setq mu4e-maildir "~/Maildir")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;;helper function to help silence minibuffer messages
(defun suppress-messages (old-fun &rest args)
  (cl-flet ((silence (&rest args1) (ignore)))
    (advice-add 'message :around #'silence)
    (unwind-protect
         (apply old-fun args)
      (advice-remove 'message #'silence))))

;;automatically update emails every X seconds
(setq mu4e-update-interval 60)
(setq mu4e-get-mail-command "offlineimap")

;;and make it shut up about it
(advice-add 'mu4e-update-mail-and-index :around #'suppress-messages)
(advice-add 'mu4e-index-message :around #'suppress-messages)
(advice-add 'progress-reporter-done :around #'suppress-messages)


;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ja''.

(setq mu4e-html2text-command
      "w3m -o display_link_number=1 -cols 120 -dump -T text/html")

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
         ("/[Gmail].Sent Mail"   . ?s)
         ("/[Gmail].Trash"       . ?t)
         ("/[Gmail].All Mail"    . ?a)
	 ("/JobHunt"             . ?j)))

;; something about ourselves
(setq
 user-mail-address "joeallen92@gmail.com"
 user-full-name  "Joe Allen"
 message-signature
 (concat
  "Joe Allen\n"
  "Email: joeallen92@gmail.com\n"
  "\n"))

(setq message-send-mail-function 'smtpmail-send-it
    smtpmail-stream-type 'starttls
    smtpmail-default-smtp-server "smtp.gmail.com"
    smtpmail-smtp-server "smtp.gmail.com"
    smtpmail-smtp-service 587)

;;for attachments
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)


(provide 'init-mu4e)
