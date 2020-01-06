Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5341317D3
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=U6QLTcFStB+zJcbpUwXROiVEWZVowuIYR8i3HOR6pkg=;
	b=Sb+g4Uug+xkgheItyY4hCtCxiLr3uC2vYbcv7q2HYahb9gFPbLB/AOhfA2oTi7YiXVtzae
	ZUnYhSi0/fv/Jpwq1oUCB38tlAVvqGeT9LyCk67yqh7cCaglv4i7ZyyDGguypR08JBEUPf
	4VZI7W8rswx8YeM10Pvsv0kn43fkRtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-uFX4SABXMRqqog3nekRV2A-1; Mon, 06 Jan 2020 13:55:07 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B73800D4E;
	Mon,  6 Jan 2020 18:55:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF54560E1C;
	Mon,  6 Jan 2020 18:55:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9A3C1800B97;
	Mon,  6 Jan 2020 18:54:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IsuYW026960 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:54:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24A395DA7C; Mon,  6 Jan 2020 18:54:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14B775D9E5;
	Mon,  6 Jan 2020 18:54:52 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 2/9] netfilter: normalize ebtables function
	declarations
Date: Mon,  6 Jan 2020 13:54:03 -0500
Message-Id: <c07cc1ecac3aaa09ebee771fa53e73ab6ac4f75f.1577830902.git.rgb@redhat.com>
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
X-MC-Unique: uFX4SABXMRqqog3nekRV2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Git context diffs were being produced with unhelpful declaration types
in the place of function names to help identify the funciton in which
changes were made.

Normalize ebtables function declarations so that git context diff
function labels work as expected.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/bridge/netfilter/ebtables.c | 100 ++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 4096d8a74a2b..c9dff9e11ddb 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -76,9 +76,9 @@ static int ebt_standard_compat_to_user(void __user *dst, const void *src)
 #endif
 };
 
-static inline int
-ebt_do_watcher(const struct ebt_entry_watcher *w, struct sk_buff *skb,
-	       struct xt_action_param *par)
+static inline int ebt_do_watcher(const struct ebt_entry_watcher *w,
+				 struct sk_buff *skb,
+				 struct xt_action_param *par)
 {
 	par->target   = w->u.watcher;
 	par->targinfo = w->data;
@@ -87,17 +87,17 @@ static int ebt_standard_compat_to_user(void __user *dst, const void *src)
 	return 0;
 }
 
-static inline int
-ebt_do_match(struct ebt_entry_match *m, const struct sk_buff *skb,
-	     struct xt_action_param *par)
+static inline int ebt_do_match(struct ebt_entry_match *m,
+			       const struct sk_buff *skb,
+			       struct xt_action_param *par)
 {
 	par->match     = m->u.match;
 	par->matchinfo = m->data;
 	return !m->u.match->match(skb, par);
 }
 
-static inline int
-ebt_dev_check(const char *entry, const struct net_device *device)
+static inline int ebt_dev_check(const char *entry,
+				const struct net_device *device)
 {
 	int i = 0;
 	const char *devname;
@@ -114,9 +114,10 @@ static int ebt_standard_compat_to_user(void __user *dst, const void *src)
 }
 
 /* process standard matches */
-static inline int
-ebt_basic_match(const struct ebt_entry *e, const struct sk_buff *skb,
-		const struct net_device *in, const struct net_device *out)
+static inline int ebt_basic_match(const struct ebt_entry *e,
+				  const struct sk_buff *skb,
+				  const struct net_device *in,
+				  const struct net_device *out)
 {
 	const struct ethhdr *h = eth_hdr(skb);
 	const struct net_bridge_port *p;
@@ -163,14 +164,12 @@ static int ebt_standard_compat_to_user(void __user *dst, const void *src)
 	return 0;
 }
 
-static inline
-struct ebt_entry *ebt_next_entry(const struct ebt_entry *entry)
+static inline struct ebt_entry *ebt_next_entry(const struct ebt_entry *entry)
 {
 	return (void *)entry + entry->next_offset;
 }
 
-static inline const struct ebt_entry_target *
-ebt_get_target_c(const struct ebt_entry *e)
+static inline const struct ebt_entry_target *ebt_get_target_c(const struct ebt_entry *e)
 {
 	return ebt_get_target((struct ebt_entry *)e);
 }
@@ -304,9 +303,9 @@ unsigned int ebt_do_table(struct sk_buff *skb,
 }
 
 /* If it succeeds, returns element and locks mutex */
-static inline void *
-find_inlist_lock_noload(struct list_head *head, const char *name, int *error,
-			struct mutex *mutex)
+static inline void *find_inlist_lock_noload(struct list_head *head,
+					    const char *name, int *error,
+					    struct mutex *mutex)
 {
 	struct {
 		struct list_head list;
@@ -323,18 +322,18 @@ unsigned int ebt_do_table(struct sk_buff *skb,
 	return NULL;
 }
 
-static void *
-find_inlist_lock(struct list_head *head, const char *name, const char *prefix,
-		 int *error, struct mutex *mutex)
+static void *find_inlist_lock(struct list_head *head, const char *name,
+			      const char *prefix, int *error,
+			      struct mutex *mutex)
 {
 	return try_then_request_module(
 			find_inlist_lock_noload(head, name, error, mutex),
 			"%s%s", prefix, name);
 }
 
-static inline struct ebt_table *
-find_table_lock(struct net *net, const char *name, int *error,
-		struct mutex *mutex)
+static inline struct ebt_table *find_table_lock(struct net *net,
+						const char *name, int *error,
+						struct mutex *mutex)
 {
 	return find_inlist_lock(&net->xt.tables[NFPROTO_BRIDGE], name,
 				"ebtable_", error, mutex);
@@ -350,9 +349,10 @@ static inline void ebt_free_table_info(struct ebt_table_info *info)
 		vfree(info->chainstack);
 	}
 }
-static inline int
-ebt_check_match(struct ebt_entry_match *m, struct xt_mtchk_param *par,
-		unsigned int *cnt)
+
+static inline int ebt_check_match(struct ebt_entry_match *m,
+				  struct xt_mtchk_param *par,
+				  unsigned int *cnt)
 {
 	const struct ebt_entry *e = par->entryinfo;
 	struct xt_match *match;
@@ -387,9 +387,9 @@ static inline void ebt_free_table_info(struct ebt_table_info *info)
 	return 0;
 }
 
-static inline int
-ebt_check_watcher(struct ebt_entry_watcher *w, struct xt_tgchk_param *par,
-		  unsigned int *cnt)
+static inline int ebt_check_watcher(struct ebt_entry_watcher *w,
+				    struct xt_tgchk_param *par,
+				    unsigned int *cnt)
 {
 	const struct ebt_entry *e = par->entryinfo;
 	struct xt_target *watcher;
@@ -490,11 +490,12 @@ static int ebt_verify_pointers(const struct ebt_replace *repl,
 /* this one is very careful, as it is the first function
  * to parse the userspace data
  */
-static inline int
-ebt_check_entry_size_and_hooks(const struct ebt_entry *e,
-			       const struct ebt_table_info *newinfo,
-			       unsigned int *n, unsigned int *cnt,
-			       unsigned int *totalcnt, unsigned int *udc_cnt)
+static inline int ebt_check_entry_size_and_hooks(const struct ebt_entry *e,
+						 const struct ebt_table_info *newinfo,
+						 unsigned int *n,
+						 unsigned int *cnt,
+						 unsigned int *totalcnt,
+						 unsigned int *udc_cnt)
 {
 	int i;
 
@@ -551,9 +552,10 @@ struct ebt_cl_stack {
 /* We need these positions to check that the jumps to a different part of the
  * entries is a jump to the beginning of a new chain.
  */
-static inline int
-ebt_get_udc_positions(struct ebt_entry *e, struct ebt_table_info *newinfo,
-		      unsigned int *n, struct ebt_cl_stack *udc)
+static inline int ebt_get_udc_positions(struct ebt_entry *e,
+					struct ebt_table_info *newinfo,
+					unsigned int *n,
+					struct ebt_cl_stack *udc)
 {
 	int i;
 
@@ -577,8 +579,8 @@ struct ebt_cl_stack {
 	return 0;
 }
 
-static inline int
-ebt_cleanup_match(struct ebt_entry_match *m, struct net *net, unsigned int *i)
+static inline int ebt_cleanup_match(struct ebt_entry_match *m,
+				    struct net *net, unsigned int *i)
 {
 	struct xt_mtdtor_param par;
 
@@ -595,8 +597,8 @@ struct ebt_cl_stack {
 	return 0;
 }
 
-static inline int
-ebt_cleanup_watcher(struct ebt_entry_watcher *w, struct net *net, unsigned int *i)
+static inline int ebt_cleanup_watcher(struct ebt_entry_watcher *w,
+				      struct net *net, unsigned int *i)
 {
 	struct xt_tgdtor_param par;
 
@@ -613,8 +615,8 @@ struct ebt_cl_stack {
 	return 0;
 }
 
-static inline int
-ebt_cleanup_entry(struct ebt_entry *e, struct net *net, unsigned int *cnt)
+static inline int ebt_cleanup_entry(struct ebt_entry *e, struct net *net,
+				    unsigned int *cnt)
 {
 	struct xt_tgdtor_param par;
 	struct ebt_entry_target *t;
@@ -638,11 +640,11 @@ struct ebt_cl_stack {
 	return 0;
 }
 
-static inline int
-ebt_check_entry(struct ebt_entry *e, struct net *net,
-		const struct ebt_table_info *newinfo,
-		const char *name, unsigned int *cnt,
-		struct ebt_cl_stack *cl_s, unsigned int udc_cnt)
+static inline int ebt_check_entry(struct ebt_entry *e, struct net *net,
+				  const struct ebt_table_info *newinfo,
+				  const char *name, unsigned int *cnt,
+				  struct ebt_cl_stack *cl_s,
+				  unsigned int udc_cnt)
 {
 	struct ebt_entry_target *t;
 	struct xt_target *target;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

