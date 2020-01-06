Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 196FF1317D2
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=kxfKwdUhZRDv0P6/6IApWopZOL2sH6tQvwOT3xUU348=;
	b=aIFTd9Z5gWp17OKxBWjrQAy5KDFvpdqMlZbPeGCB2PfrS5ta4rl/V6My62DTtr1E0udlEe
	wrF5VbV2C3pFydVGFTSfFDfj+83TORkkAmH2iXlQVHK/6fKwpyzZdJfnM2RO5v2jEft4Sc
	+L9N2vYUqWVUCpMS2m5fXahdM3kpSRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-7gB3U5WkNwuyVMGp0EiE7A-1; Mon, 06 Jan 2020 13:55:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E785FDBA3;
	Mon,  6 Jan 2020 18:55:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD7E37DB55;
	Mon,  6 Jan 2020 18:55:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAD65180880D;
	Mon,  6 Jan 2020 18:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IsqLr026945 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:54:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A81475DA76; Mon,  6 Jan 2020 18:54:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9873F5D9E5;
	Mon,  6 Jan 2020 18:54:49 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
Date: Mon,  6 Jan 2020 13:54:02 -0500
Message-Id: <194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7gB3U5WkNwuyVMGp0EiE7A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Git context diffs were being produced with unhelpful declaration types
in the place of function names to help identify the funciton in which
changes were made.

Normalize x_table function declarations so that git context diff
function labels work as expected.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/netfilter/x_tables.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index ce70c2576bb2..0094853ab42a 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -77,8 +77,7 @@ int xt_register_target(struct xt_target *target)
 }
 EXPORT_SYMBOL(xt_register_target);
 
-void
-xt_unregister_target(struct xt_target *target)
+void xt_unregister_target(struct xt_target *target)
 {
 	u_int8_t af = target->family;
 
@@ -88,8 +87,7 @@ int xt_register_target(struct xt_target *target)
 }
 EXPORT_SYMBOL(xt_unregister_target);
 
-int
-xt_register_targets(struct xt_target *target, unsigned int n)
+int xt_register_targets(struct xt_target *target, unsigned int n)
 {
 	unsigned int i;
 	int err = 0;
@@ -108,8 +106,7 @@ int xt_register_target(struct xt_target *target)
 }
 EXPORT_SYMBOL(xt_register_targets);
 
-void
-xt_unregister_targets(struct xt_target *target, unsigned int n)
+void xt_unregister_targets(struct xt_target *target, unsigned int n)
 {
 	while (n-- > 0)
 		xt_unregister_target(&target[n]);
@@ -127,8 +124,7 @@ int xt_register_match(struct xt_match *match)
 }
 EXPORT_SYMBOL(xt_register_match);
 
-void
-xt_unregister_match(struct xt_match *match)
+void xt_unregister_match(struct xt_match *match)
 {
 	u_int8_t af = match->family;
 
@@ -138,8 +134,7 @@ int xt_register_match(struct xt_match *match)
 }
 EXPORT_SYMBOL(xt_unregister_match);
 
-int
-xt_register_matches(struct xt_match *match, unsigned int n)
+int xt_register_matches(struct xt_match *match, unsigned int n)
 {
 	unsigned int i;
 	int err = 0;
@@ -158,8 +153,7 @@ int xt_register_match(struct xt_match *match)
 }
 EXPORT_SYMBOL(xt_register_matches);
 
-void
-xt_unregister_matches(struct xt_match *match, unsigned int n)
+void xt_unregister_matches(struct xt_match *match, unsigned int n)
 {
 	while (n-- > 0)
 		xt_unregister_match(&match[n]);
@@ -204,8 +198,8 @@ struct xt_match *xt_find_match(u8 af, const char *name, u8 revision)
 }
 EXPORT_SYMBOL(xt_find_match);
 
-struct xt_match *
-xt_request_find_match(uint8_t nfproto, const char *name, uint8_t revision)
+struct xt_match *xt_request_find_match(u8 nfproto, const char *name,
+				       u8 revision)
 {
 	struct xt_match *match;
 
@@ -391,8 +385,8 @@ int xt_find_revision(u8 af, const char *name, u8 revision, int target,
 }
 EXPORT_SYMBOL_GPL(xt_find_revision);
 
-static char *
-textify_hooks(char *buf, size_t size, unsigned int mask, uint8_t nfproto)
+static char *textify_hooks(char *buf, size_t size, unsigned int mask,
+			   uint8_t nfproto)
 {
 	static const char *const inetbr_names[] = {
 		"PREROUTING", "INPUT", "FORWARD",
@@ -1349,11 +1343,10 @@ struct xt_counters *xt_counters_alloc(unsigned int counters)
 }
 EXPORT_SYMBOL(xt_counters_alloc);
 
-struct xt_table_info *
-xt_replace_table(struct xt_table *table,
-	      unsigned int num_counters,
-	      struct xt_table_info *newinfo,
-	      int *error)
+struct xt_table_info *xt_replace_table(struct xt_table *table,
+				       unsigned int num_counters,
+				       struct xt_table_info *newinfo,
+				       int *error)
 {
 	struct xt_table_info *private;
 	unsigned int cpu;
@@ -1542,7 +1535,7 @@ enum {
 };
 
 static void *xt_mttg_seq_next(struct seq_file *seq, void *v, loff_t *ppos,
-    bool is_target)
+			      bool is_target)
 {
 	static const uint8_t next_class[] = {
 		[MTTG_TRAV_NFP_UNSPEC] = MTTG_TRAV_NFP_SPEC,
@@ -1583,7 +1576,7 @@ static void *xt_mttg_seq_next(struct seq_file *seq, void *v, loff_t *ppos,
 }
 
 static void *xt_mttg_seq_start(struct seq_file *seq, loff_t *pos,
-    bool is_target)
+			       bool is_target)
 {
 	struct nf_mttg_trav *trav = seq->private;
 	unsigned int j;
@@ -1692,8 +1685,8 @@ static int xt_target_seq_show(struct seq_file *seq, void *v)
  * This function will create the nf_hook_ops that the x_table needs
  * to hand to xt_hook_link_net().
  */
-struct nf_hook_ops *
-xt_hook_ops_alloc(const struct xt_table *table, nf_hookfn *fn)
+struct nf_hook_ops *xt_hook_ops_alloc(const struct xt_table *table,
+				      nf_hookfn *fn)
 {
 	unsigned int hook_mask = table->valid_hooks;
 	uint8_t i, num_hooks = hweight32(hook_mask);
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

