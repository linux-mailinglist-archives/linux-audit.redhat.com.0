Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7704816B496
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582584833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DVBC+hLCwfdMxjfbp8yH3H1Fql2toui/k52Oyn15eSY=;
	b=hvPN5kQnYTa9A3jXYw8Kk4QVngbU6WAXIMR4rlZ7a4VA6t94szwH2qzkkq5kkyHZc7KFNW
	1xnoVDnfmeVPlSOfqau6G5s9oTPkkJm2S3UjFksbu3SA3MIhgYWT0UWoj44zl5GLST/d49
	sc8qZk+CakeUPN2w2h1W7QqyDpPQjbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-MS1sdWSONCe6Xq1pU1Ciyg-1; Mon, 24 Feb 2020 17:53:51 -0500
X-MC-Unique: MS1sdWSONCe6Xq1pU1Ciyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29F8F1902EA4;
	Mon, 24 Feb 2020 22:53:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 960145D9E5;
	Mon, 24 Feb 2020 22:53:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D10318089C8;
	Mon, 24 Feb 2020 22:53:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMrbXN024716 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:53:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F319810B2B23; Mon, 24 Feb 2020 22:53:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDAA710B2B20
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:53:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E32185A30F
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:53:35 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-djFwbjT8MUerMED7xOe-Eg-1; Mon, 24 Feb 2020 17:53:31 -0500
X-MC-Unique: djFwbjT8MUerMED7xOe-Eg-1
Received: by mail-qv1-f65.google.com with SMTP id ci20so3544273qvb.4
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=Ac0Lx0NaAR0n7J/84WsBFNOndkn3dUaRGRCdoaxhZFs=;
	b=t1vUnSNSIYoCsR7vy70EilSMmWWVueyJa/+RxACR3dJoRUuiR6NBMbu2iM1Mwi1EMx
	fxwzs2UoG26mwl03C1nSmgrb3tkViWO9sKHN64iCuA2/ssZQIDPf3isEPzoQ8qqyNUJa
	+eYsmLomkDIRWQD7UkWc8lXF3+6FWOOHeVp8LlSrMcEqIhVzRGqKuvz9Om+2MdTL5+/P
	goVTggvZPkKUT5xVwS2sRftDnScvIHVOi6li8rXa9avBl35JkHarVZeGwQxGdFvPU2Vp
	3xBC8WT9STHN4yUV0b1jbOGvilv/Wq2Ha+LAHWy6DlyMNBZBgKj/cb0/9/TFgXWHyt+m
	apzQ==
X-Gm-Message-State: APjAAAWemLiBfKQkMWKU43QjVM991MYh5eWnChokLErBzz+UtcX00lyi
	xnTS2hin8ZvG860umEDcAKQtKQ1AfA==
X-Google-Smtp-Source: APXvYqzKwaNiW276Cs9QOzn0mZsObf4r1itp6U4I+rfH3o0PJKptbnP0KywO2LHLWzd3+H6KvLjnnQ==
X-Received: by 2002:a05:6214:13a8:: with SMTP id
	h8mr45099422qvz.41.1582584810866; 
	Mon, 24 Feb 2020 14:53:30 -0800 (PST)
Received: from localhost (pool-71-245-238-133.bstnma.fios.verizon.net.
	[71.245.238.133])
	by smtp.gmail.com with ESMTPSA id h8sm6742261qtm.51.2020.02.24.14.53.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 14:53:30 -0800 (PST)
Subject: [PATCH] audit: always check the netlink payload length in
	audit_receive_msg()
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Mon, 24 Feb 2020 17:53:29 -0500
Message-ID: <158258480936.525901.8492820711796738271.stgit@chester>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch ensures that we always check the netlink payload length
in audit_receive_msg() before we take any action on the payload
itself.

Cc: stable@vger.kernel.org
Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com
Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.c |   43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 17b0d523afb3..6e8b176bdb68 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1101,13 +1101,11 @@ static void audit_log_feature_change(int which, u32 old_feature, u32 new_feature
 	audit_log_end(ab);
 }
 
-static int audit_set_feature(struct sk_buff *skb)
+static int audit_set_feature(struct audit_features *uaf)
 {
-	struct audit_features *uaf;
 	int i;
 
 	BUILD_BUG_ON(AUDIT_LAST_FEATURE + 1 > ARRAY_SIZE(audit_feature_names));
-	uaf = nlmsg_data(nlmsg_hdr(skb));
 
 	/* if there is ever a version 2 we should handle that here */
 
@@ -1175,6 +1173,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 {
 	u32			seq;
 	void			*data;
+	int			data_len;
 	int			err;
 	struct audit_buffer	*ab;
 	u16			msg_type = nlh->nlmsg_type;
@@ -1188,6 +1187,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 
 	seq  = nlh->nlmsg_seq;
 	data = nlmsg_data(nlh);
+	data_len = nlmsg_len(nlh);
 
 	switch (msg_type) {
 	case AUDIT_GET: {
@@ -1211,7 +1211,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		struct audit_status	s;
 		memset(&s, 0, sizeof(s));
 		/* guard against past and future API changes */
-		memcpy(&s, data, min_t(size_t, sizeof(s), nlmsg_len(nlh)));
+		memcpy(&s, data, min_t(size_t, sizeof(s), data_len));
 		if (s.mask & AUDIT_STATUS_ENABLED) {
 			err = audit_set_enabled(s.enabled);
 			if (err < 0)
@@ -1314,11 +1314,14 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		if (err)
 			return err;
 		break;
-	case AUDIT_SET_FEATURE:
-		err = audit_set_feature(skb);
+	case AUDIT_SET_FEATURE: {
+		if (data_len < sizeof(struct audit_features))
+			return -EINVAL;
+		err = audit_set_feature(data);
 		if (err)
 			return err;
 		break;
+	}
 	case AUDIT_USER:
 	case AUDIT_FIRST_USER_MSG ... AUDIT_LAST_USER_MSG:
 	case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
@@ -1327,6 +1330,8 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 
 		err = audit_filter(msg_type, AUDIT_FILTER_USER);
 		if (err == 1) { /* match or error */
+			char *str = data;
+
 			err = 0;
 			if (msg_type == AUDIT_USER_TTY) {
 				err = tty_audit_push();
@@ -1334,26 +1339,24 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 					break;
 			}
 			audit_log_user_recv_msg(&ab, msg_type);
-			if (msg_type != AUDIT_USER_TTY)
+			if (msg_type != AUDIT_USER_TTY) {
+				/* ensure NULL termination */
+				str[data_len - 1] = '\0';
 				audit_log_format(ab, " msg='%.*s'",
 						 AUDIT_MESSAGE_TEXT_MAX,
-						 (char *)data);
-			else {
-				int size;
-
+						 str);
+			} else {
 				audit_log_format(ab, " data=");
-				size = nlmsg_len(nlh);
-				if (size > 0 &&
-				    ((unsigned char *)data)[size - 1] == '\0')
-					size--;
-				audit_log_n_untrustedstring(ab, data, size);
+				if (data_len > 0 && str[data_len - 1] == '\0')
+					data_len--;
+				audit_log_n_untrustedstring(ab, data, data_len);
 			}
 			audit_log_end(ab);
 		}
 		break;
 	case AUDIT_ADD_RULE:
 	case AUDIT_DEL_RULE:
-		if (nlmsg_len(nlh) < sizeof(struct audit_rule_data))
+		if (data_len < sizeof(struct audit_rule_data))
 			return -EINVAL;
 		if (audit_enabled == AUDIT_LOCKED) {
 			audit_log_common_recv_msg(audit_context(), &ab,
@@ -1365,7 +1368,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 			audit_log_end(ab);
 			return -EPERM;
 		}
-		err = audit_rule_change(msg_type, seq, data, nlmsg_len(nlh));
+		err = audit_rule_change(msg_type, seq, data, data_len);
 		break;
 	case AUDIT_LIST_RULES:
 		err = audit_list_rules_send(skb, seq);
@@ -1380,7 +1383,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_MAKE_EQUIV: {
 		void *bufp = data;
 		u32 sizes[2];
-		size_t msglen = nlmsg_len(nlh);
+		size_t msglen = data_len;
 		char *old, *new;
 
 		err = -EINVAL;
@@ -1456,7 +1459,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 
 		memset(&s, 0, sizeof(s));
 		/* guard against past and future API changes */
-		memcpy(&s, data, min_t(size_t, sizeof(s), nlmsg_len(nlh)));
+		memcpy(&s, data, min_t(size_t, sizeof(s), data_len));
 		/* check if new data is valid */
 		if ((s.enabled != 0 && s.enabled != 1) ||
 		    (s.log_passwd != 0 && s.log_passwd != 1))

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

