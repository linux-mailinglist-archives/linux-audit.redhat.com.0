Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5729E1B31E5
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 23:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587504334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pczeHsfM7GatbUyKl17T+Y/EkZ96+bLxzWB013EV0w0=;
	b=eWGL3QPl0YINGqWqCGwT7dmZOyaexMR/G092mqGnJ8EGQmRuqcMp1ixQYxhFzry/NfmR1Y
	4E8w460i5XnxSAsCJAMtx4d5LljGboaTy/xr6kg1aInUS7e7TbxlfQ//nibZQGJrzS9uJw
	NQGireLTaa7L1YFg0+AoIH4mBfWjzSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ZcGIwm9WNOy8O7qc8MWi4Q-1; Tue, 21 Apr 2020 17:25:32 -0400
X-MC-Unique: ZcGIwm9WNOy8O7qc8MWi4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86152DB60;
	Tue, 21 Apr 2020 21:25:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAEBCB3A7B;
	Tue, 21 Apr 2020 21:25:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F0F918089CD;
	Tue, 21 Apr 2020 21:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LLP6Qd007185 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 17:25:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54E7A10B2B25; Tue, 21 Apr 2020 21:25:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5107F10B2B23
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 21:25:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6713A185A78F
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 21:25:04 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-513-OnDJMs8lOAiYo4YU1BTqAQ-1; Tue, 21 Apr 2020 17:25:01 -0400
X-MC-Unique: OnDJMs8lOAiYo4YU1BTqAQ-1
Received: by mail-ej1-f67.google.com with SMTP id n4so165309ejs.11
	for <linux-audit@redhat.com>; Tue, 21 Apr 2020 14:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=cR8iHy2e+Wf/C4FGn3M7r5/LB2cD+V4OQdm7W6okJfk=;
	b=bXEoY8FET3nUppQhqrRiDVI3mBRNibWVtI96jwHGKgB7o3Ha2oktUBowzZBFcM0/Q7
	/uMMv26ZfmfQMTuAqrSsn7YaAFvqKEjFgUo6EQiW7wOEhpuV1FlNVossBWSAcWGJF81x
	aQenbM4ZKy/YdlgP1Wc4+SeUOXGu2+RBnBlIkuLohnp9mhBygKAgoUJE7WbfJQFib+3V
	BTw3eTjJcYLCZN78i7QVw/T8xSjnLzcS1Mti8vrJcXRZgOXkZIzWsV/vpU1UxySodhMZ
	NkmuycDOhfcui+m/A2RyZD4zZgK2qarl6cCci5cI0KNePtLJQcq9NxO+33JV9f1FqgEj
	3CIw==
X-Gm-Message-State: AGi0PubdAdLU/wbyHd+Ff8H3vOjzlzpwh2QAR9tVUd2ZN+aUlqJNu2E0
	YddrXS+1AU095/jy+BjJOuVBSLJ569sJyY12bQm4Nu4=
X-Google-Smtp-Source: APiQypL3v1o/zfzJ9Pll9do+cUdsVjnpU3brxKrEfQMhn0mYepmUZu/ENfNKsU8GmFvE/Dxxt5d4n/hL1HtLD9FQPvI=
X-Received: by 2002:a17:906:4cd2:: with SMTP id
	q18mr16185168ejt.70.1587504299973; 
	Tue, 21 Apr 2020 14:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <158741856073.246860.5955712228915579.stgit@chester>
In-Reply-To: <158741856073.246860.5955712228915579.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Apr 2020 17:24:48 -0400
Message-ID: <CAHC9VhQ4FSmLF0UG9mk99t0A5MXYHCZC4+69AFMtoFB0iqNyXA@mail.gmail.com>
Subject: Re: [PATCH] audit: check the length of userspace generated audit
	records
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LLP6Qd007185
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2020 at 5:36 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Commit 756125289285 ("audit: always check the netlink payload length
> in audit_receive_msg()") fixed a number of missing message length
> checks, but forgot to check the length of userspace generated audit
> records.  The good news is that you need CAP_AUDIT_WRITE to submit
> userspace audit records, which is generally only given to trusted
> processes, so the impact should be limited.
>
> Cc: stable@vger.kernel.org
> Fixes: 756125289285 ("audit: always check the netlink payload length in audit_receive_msg()")
> Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/audit.c |    3 +++
>  1 file changed, 3 insertions(+)

Merged into audit/stable-5.7; I'll send it up to Linus later this week.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index b69c8b460341..87f31bf1f0a0 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>         case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
>                 if (!audit_enabled && msg_type != AUDIT_USER_AVC)
>                         return 0;
> +               /* exit early if there isn't at least one character to print */
> +               if (data_len < 2)
> +                       return -EINVAL;
>
>                 err = audit_filter(msg_type, AUDIT_FILTER_USER);
>                 if (err == 1) { /* match or error */

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

