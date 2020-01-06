Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AAB3B131A1F
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 22:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578345108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jY2UwpS1iKFOrde6oKAjQGpk85HhhA3Hj/qwVGFTkt0=;
	b=aSe2kcCLb+04hpGo1KgWFHCbKj60E73Kxkde6CuU9qVqEIpmDoQeEnbqQ9IKFLMTIJZotB
	PoC+DpASH23sGjkPi5f9fP30L6fP5imZk7rglCaGjvVXfG4tBy8tno/LSwf6gEsVTkZCW3
	62C7jwgT8na6IbdSpaU3UBfXMG9hzlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-OABvz7BrMvmhvYNsMS63Ww-1; Mon, 06 Jan 2020 16:11:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72D3800D48;
	Mon,  6 Jan 2020 21:11:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9265B5C290;
	Mon,  6 Jan 2020 21:11:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50ED081C78;
	Mon,  6 Jan 2020 21:11:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006KUs5v000534 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 15:30:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9F2610DCF5C; Mon,  6 Jan 2020 20:30:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B489A10FD2B3
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:30:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A447E803280
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:30:51 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-WxxL0kEgNQyaqfFK3VR42w-1; Mon, 06 Jan 2020 15:30:48 -0500
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ioZ1R-0006k7-0F; Mon, 06 Jan 2020 21:30:45 +0100
Date: Mon, 6 Jan 2020 21:30:44 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 2/9] netfilter: normalize ebtables function
	declarations
Message-ID: <20200106203044.GQ795@breakpoint.cc>
References: <cover.1577830902.git.rgb@redhat.com>
	<c07cc1ecac3aaa09ebee771fa53e73ab6ac4f75f.1577830902.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c07cc1ecac3aaa09ebee771fa53e73ab6ac4f75f.1577830902.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: WxxL0kEgNQyaqfFK3VR42w-1
X-MC-Unique: OABvz7BrMvmhvYNsMS63Ww-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 006KUs5v000534
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 16:11:25 -0500
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> Git context diffs were being produced with unhelpful declaration types
> in the place of function names to help identify the funciton in which
> changes were made.
> 
> Normalize ebtables function declarations so that git context diff
> function labels work as expected.
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

I suggest that you also drop the inline keyword for all functions
that are called from control path, for example

> -static inline void *
> -find_inlist_lock_noload(struct list_head *head, const char *name, int *error,
> -			struct mutex *mutex)
> +static inline void *find_inlist_lock_noload(struct list_head *head,
> +					    const char *name, int *error,
> +					    struct mutex *mutex)

> -static inline struct ebt_table *
> -find_table_lock(struct net *net, const char *name, int *error,
> -		struct mutex *mutex)
> +static inline struct ebt_table *find_table_lock(struct net *net,

> -static inline int
> -ebt_check_match(struct ebt_entry_match *m, struct xt_mtchk_param *par,
> -		unsigned int *cnt)
> +
> +static inline int ebt_check_match(struct ebt_entry_match *m,

> -static inline int
> -ebt_check_watcher(struct ebt_entry_watcher *w, struct xt_tgchk_param *par,
> -		  unsigned int *cnt)

> -static inline int
> -ebt_check_entry_size_and_hooks(const struct ebt_entry *e,

> -static inline int
> -ebt_get_udc_positions(struct ebt_entry *e, struct ebt_table_info *newinfo,
> -		      unsigned int *n, struct ebt_cl_stack *udc)

> -static inline int
> -ebt_cleanup_match(struct ebt_entry_match *m, struct net *net, unsigned int *i)

> -static inline int
> -ebt_cleanup_watcher(struct ebt_entry_watcher *w, struct net *net, unsigned int *i)

> -static inline int
> -ebt_cleanup_entry(struct ebt_entry *e, struct net *net, unsigned int *cnt)

> -static inline int
> -ebt_check_entry(struct ebt_entry *e, struct net *net,
> -		const struct ebt_table_info *newinfo,
> -		const char *name, unsigned int *cnt,
> -		struct ebt_cl_stack *cl_s, unsigned int udc_cnt)

.. can all have 'inline' removed.  Other than that this looks good to me.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

