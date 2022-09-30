Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F45F1117
	for <lists+linux-audit@lfdr.de>; Fri, 30 Sep 2022 19:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664559938;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2gQ5BnQncierFEtyW5vLtinbUQC67+iADCNEa6mTDxY=;
	b=PHHIzTsYp99ybsCo9YNnPaovHvB2m6yfK7ULsgjMnIrusmmX8bRARdxGf7BsE3pxmbuC1x
	tqpyNgT/FzPXhZJBUVIYsyfU9RggyV9nLth1Oq4qj7t+WHgR0da1WHM+dcYbgH/C/W3/OP
	E+MqHBV1ozp9pZVM0rLxmhC4oYLtx38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-8ZTnrqLkNMKKOQmfKA4Z0A-1; Fri, 30 Sep 2022 13:45:36 -0400
X-MC-Unique: 8ZTnrqLkNMKKOQmfKA4Z0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39F5B800B30;
	Fri, 30 Sep 2022 17:45:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A16E9C15BA4;
	Fri, 30 Sep 2022 17:45:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C57EB1946A6D;
	Fri, 30 Sep 2022 17:45:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 84EC61946A52 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Sep 2022 17:45:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F109492CA5; Fri, 30 Sep 2022 17:45:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.10.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1B4492CA2;
 Fri, 30 Sep 2022 17:45:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
Date: Fri, 30 Sep 2022 13:45:26 -0400
Message-ID: <8171459.NyiUUSuA9g@x2>
Organization: Red Hat
In-Reply-To: <20220927225944.2254360-2-ankur.a.arora@oracle.com>
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: boris.ostrovsky@oracle.com, Ankur Arora <ankur.a.arora@oracle.com>,
 linux-kernel@vger.kernel.org, eparis@redhat.com, konrad.wilk@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Thanks for the detailed notes on this investigation. It really is  a lot of 
good information backing this up. However, there will come a day when someone 
sees this "major = ctx->major" and they will send a patch to "fix" this 
unnecessary assignment. If you are sending a V2 of this set, I would suggest 
adding some comment in the code that this is for a performance improvement 
and to see the commit message for additional info.

Thanks,
-Steve

On Tuesday, September 27, 2022 6:59:42 PM EDT Ankur Arora wrote:
> ctx->major contains the current syscall number. This is, of course, a
> constant for the duration of the syscall. Unfortunately, GCC's alias
> analysis cannot prove that it is not modified via a pointer in the
> audit_filter_syscall() loop, and so always loads it from memory.
> 
> In and of itself the load isn't very expensive (ops dependent on the
> ctx->major load are only used to determine the direction of control flow
> and have short dependence chains and, in any case the related branches
> get predicted perfectly in the fastpath) but still cache ctx->major
> in a local for two reasons:
> 
> * ctx->major is in the first cacheline of struct audit_context and has
>   similar alignment as audit_entry::list audit_entry. For cases
>   with a lot of audit rules, doing this reduces one source of contention
>   from a potentially busy cache-set.
> 
> * audit_in_mask() (called in the hot loop in audit_filter_syscall())
>   does cast manipulation and error checking on ctx->major:
> 
>      audit_in_mask(const struct audit_krule *rule, unsigned long val):
>              if (val > 0xffffffff)
>                      return false;
> 
>              word = AUDIT_WORD(val);
>              if (word >= AUDIT_BITMASK_SIZE)
>                      return false;
> 
>              bit = AUDIT_BIT(val);
> 
>              return rule->mask[word] & bit;
> 
>   The clauses related to the rule need to be evaluated in the loop, but
>   the rest is unnecessarily re-evaluated for every loop iteration.
>   (Note, however, that most of these are cheap ALU ops and the branches
>    are perfectly predicted. However, see discussion on cycles
>    improvement below for more on why it is still worth hoisting.)
> 
> On a Skylakex system change in getpid() latency (aggregated over
> 12 boot cycles):
> 
>              Min     Mean  Median     Max       pstdev
>             (ns)     (ns)    (ns)    (ns)
> 
>  -        201.30   216.14  216.22  228.46      (+- 1.45%)
>  +        196.63   207.86  206.60  230.98      (+- 3.92%)
> 
> Performance counter stats for 'bin/getpid' (3 runs) go from:
>     cycles               836.89  (  +-   .80% )
>     instructions        2000.19  (  +-   .03% )
>     IPC                    2.39  (  +-   .83% )
>     branches             430.14  (  +-   .03% )
>     branch-misses          1.48  (  +-  3.37% )
>     L1-dcache-loads      471.11  (  +-   .05% )
>     L1-dcache-load-misses  7.62  (  +- 46.98% )
> 
>  to:
>     cycles               805.58  (  +-  4.11% )
>     instructions        1654.11  (  +-   .05% )
>     IPC                    2.06  (  +-  3.39% )
>     branches             430.02  (  +-   .05% )
>     branch-misses          1.55  (  +-  7.09% )
>     L1-dcache-loads      440.01  (  +-   .09% )
>     L1-dcache-load-misses  9.05  (  +- 74.03% )
> 
> (Both aggregated over 12 boot cycles.)
> 
> instructions: we reduce around 8 instructions/iteration because some of
> the computation is now hoisted out of the loop (branch count does not
> change because GCC, for reasons unclear, only hoists the computations
> while keeping the basic-blocks.)
> 
> cycles: improve by about 5% (in aggregate and looking at individual run
> numbers.) This is likely because we now waste fewer pipeline resources
> on unnecessary instructions which allows the control flow to
> speculatively execute further ahead shortening the execution of the loop
> a little. The final gating factor on the performance of this loop
> remains the long dependence chain due to the linked-list load.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  kernel/auditsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 79a5da1bc5bb..533b087c3c02 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -843,13 +843,14 @@ static void audit_filter_syscall(struct task_struct
> *tsk, {
>  	struct audit_entry *e;
>  	enum audit_state state;
> +	unsigned long major = ctx->major;
> 
>  	if (auditd_test_task(tsk))
>  		return;
> 
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], 
list) {
> -		if (audit_in_mask(&e->rule, ctx->major) &&
> +		if (audit_in_mask(&e->rule, major) &&
>  		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
>  				       &state, false)) {
>  			rcu_read_unlock();




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

