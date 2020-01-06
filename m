Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0F91317D5
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=9QsbkNMraF2TcnUDOZ+Q5Pbwxjcg9sC1hzJ4lKmVEXM=;
	b=fSVdCdj7xAjCi6zJZAOD0mcteG3wArDm8ZpgIyWTfU6ClRb0vVaE5dbJCdHuTTuqi+KSIf
	mEnemC952Y0KUqOYlsgUEIyWOVIjOAxW/DvLcM1vCBdPz6Uadkwo7Fr0v7Aux4fR9Mdwjz
	SnSwagiF8H1L2HgTcMR3nDMrXqNw1yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-9HKhpGhgMtGTmKiSvnNufg-1; Mon, 06 Jan 2020 13:55:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745F6107ACCA;
	Mon,  6 Jan 2020 18:55:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD9560E1C;
	Mon,  6 Jan 2020 18:55:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8801B180CB3B;
	Mon,  6 Jan 2020 18:55:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006Isx5W026973 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:54:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8BDF65DA76; Mon,  6 Jan 2020 18:54:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 862AD5D9E5;
	Mon,  6 Jan 2020 18:54:56 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 3/9] netfilter: normalize ebtables function
	declarations II
Date: Mon,  6 Jan 2020 13:54:04 -0500
Message-Id: <7df83e229cff2518e73425cdc712505fb773a9c2.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 9HKhpGhgMtGTmKiSvnNufg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Align all function declaration parameters with open parenthesis.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/bridge/netfilter/ebtables.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index c9dff9e11ddb..b3c784ae33a0 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1248,9 +1248,9 @@ void ebt_unregister_table(struct net *net, struct ebt_table *table,
 
 /* userspace just supplied us with counters */
 static int do_update_counters(struct net *net, const char *name,
-				struct ebt_counter __user *counters,
-				unsigned int num_counters,
-				const void __user *user, unsigned int len)
+			      struct ebt_counter __user *counters,
+			      unsigned int num_counters,
+			      const void __user *user, unsigned int len)
 {
 	int i, ret;
 	struct ebt_counter *tmp;
@@ -1294,7 +1294,7 @@ static int do_update_counters(struct net *net, const char *name,
 }
 
 static int update_counters(struct net *net, const void __user *user,
-			    unsigned int len)
+			   unsigned int len)
 {
 	struct ebt_replace hlp;
 
@@ -1457,8 +1457,8 @@ static int copy_everything_to_user(struct ebt_table *t, void __user *user,
 	   ebt_entry_to_user, entries, tmp.entries);
 }
 
-static int do_ebt_set_ctl(struct sock *sk,
-	int cmd, void __user *user, unsigned int len)
+static int do_ebt_set_ctl(struct sock *sk, int cmd, void __user *user,
+			  unsigned int len)
 {
 	int ret;
 	struct net *net = sock_net(sk);
@@ -1660,7 +1660,7 @@ static int compat_watcher_to_user(struct ebt_entry_watcher *w,
 }
 
 static int compat_copy_entry_to_user(struct ebt_entry *e, void __user **dstptr,
-				unsigned int *size)
+				     unsigned int *size)
 {
 	struct ebt_entry_target *t;
 	struct ebt_entry __user *ce;
@@ -2149,7 +2149,7 @@ static int size_entry_mwt(struct ebt_entry *entry, const unsigned char *base,
  * Called before validation is performed.
  */
 static int compat_copy_entries(unsigned char *data, unsigned int size_user,
-				struct ebt_entries_buf_state *state)
+			       struct ebt_entries_buf_state *state)
 {
 	unsigned int size_remaining = size_user;
 	int ret;
@@ -2167,7 +2167,8 @@ static int compat_copy_entries(unsigned char *data, unsigned int size_user,
 
 
 static int compat_copy_ebt_replace_from_user(struct ebt_replace *repl,
-					    void __user *user, unsigned int len)
+					     void __user *user,
+					     unsigned int len)
 {
 	struct compat_ebt_replace tmp;
 	int i;
@@ -2321,8 +2322,8 @@ static int compat_update_counters(struct net *net, void __user *user,
 					hlp.num_counters, user, len);
 }
 
-static int compat_do_ebt_set_ctl(struct sock *sk,
-		int cmd, void __user *user, unsigned int len)
+static int compat_do_ebt_set_ctl(struct sock *sk, int cmd, void __user *user,
+				 unsigned int len)
 {
 	int ret;
 	struct net *net = sock_net(sk);
@@ -2343,8 +2344,8 @@ static int compat_do_ebt_set_ctl(struct sock *sk,
 	return ret;
 }
 
-static int compat_do_ebt_get_ctl(struct sock *sk, int cmd,
-		void __user *user, int *len)
+static int compat_do_ebt_get_ctl(struct sock *sk, int cmd, void __user *user,
+				 int *len)
 {
 	int ret;
 	struct compat_ebt_replace tmp;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

