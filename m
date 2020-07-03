Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D7A63213BC6
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 16:25:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-2cIG244xOm-O50hMH7tBtg-1; Fri, 03 Jul 2020 10:25:55 -0400
X-MC-Unique: 2cIG244xOm-O50hMH7tBtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3A2D1902EB7;
	Fri,  3 Jul 2020 14:25:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631767AC71;
	Fri,  3 Jul 2020 14:25:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFD1A1809543;
	Fri,  3 Jul 2020 14:25:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063CfJ4R001653 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 08:41:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCFE6D0179; Fri,  3 Jul 2020 12:41:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8086D018F
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 12:41:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB8E7800296
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 12:41:16 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-RTlWoNEHML6JBlyHmXghkw-1; Fri, 03 Jul 2020 08:41:10 -0400
X-MC-Unique: RTlWoNEHML6JBlyHmXghkw-1
Received: by mail-io1-f66.google.com with SMTP id k23so32262528iom.10;
	Fri, 03 Jul 2020 05:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/3fARxYuRtacDsta1lOXw0YQpGPHS40fG/Dlgh9w8EI=;
	b=puAZJSjvUJ3WQ60c1V91qKax3ac2qB0dRAzETMPINCBq2kcl08NKZKLVa7e1S0k/Pb
	bydBj6b/Sx3vil9Z8uUjBn9Ep1BB6zTgdam2ieoNUwPLXM3U4YGieJ+kt1cx/S80FQVc
	HGR5+734fz/DPajNPyO14bR+3P1qtWS6HSObFKh7C0OpwYXJDZc9jMD6TsYDVW242WnX
	jMutrDR6ov4Wz0LzoLH/uAqhZvBbukJ9FXAvoh0k6mMknlLi1aScnpOde5RSK9CE9kgu
	u3YGPrIvIHJcZUekveMOsipmOHsH2Epb7KDoKPLNrZb5fHliwcSzEEFCiONaUW3fyGgS
	GVQw==
X-Gm-Message-State: AOAM5332qJ8RxQvBe4hLGv8lawns10khz+e6zT7O0fQWqU3Rb7gRMkhO
	zx0dqvnSxmLi70q1VErYCcnxP0H3qCkEEw/2m3z99itQ
X-Google-Smtp-Source: ABdhPJyaKBMDtXfp8jmSH/dLZJsnXIMsz48usB6Up3Wt1Y1DSANqMYxTz/l4fcbEYrunGZop8YhtM9fwEPOtlnfn92U=
X-Received: by 2002:a6b:5b0e:: with SMTP id v14mr12102540ioh.145.1593780068905;
	Fri, 03 Jul 2020 05:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
In-Reply-To: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
From: Jones Desougi <jones.desougi+netfilter@gmail.com>
Date: Fri, 3 Jul 2020 14:40:57 +0200
Message-ID: <CAGdUbJEwoxEFJZDUjF7ZwKurKNibPW86=s3yFSA6BBt-YsC=Nw@mail.gmail.com>
Subject: Re: [PATCH ghak124 v3fix] audit: add gfp parameter to audit_log_nfcfg
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 10:25:44 -0400
Cc: Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org, dan.carpenter@oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Doesn't seem entirely consistent now either though. Two cases below.

   /Jones

On Sun, Jun 28, 2020 at 5:27 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Fixed an inconsistent use of GFP flags in nft_obj_notify() that used
> GFP_KERNEL when a GFP flag was passed in to that function.  Given this
> allocated memory was then used in audit_log_nfcfg() it led to an audit
> of all other GFP allocations in net/netfilter/nf_tables_api.c and a
> modification of audit_log_nfcfg() to accept a GFP parameter.
>
> Reported-by: Dan Carptenter <dan.carpenter@oracle.com>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
>  include/linux/audit.h           |  8 ++++----
>  kernel/auditsc.c                |  4 ++--
>  net/bridge/netfilter/ebtables.c |  6 +++---
>  net/netfilter/nf_tables_api.c   | 33 +++++++++++++++++++++------------
>  net/netfilter/x_tables.c        |  5 +++--
>  5 files changed, 33 insertions(+), 23 deletions(-)
>
...
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index 164700273947..f7ff91479647 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
...
> @@ -6071,13 +6077,14 @@ static int nf_tables_getobj(struct net *net, struct sock *nlsk,
>                 reset = true;
>
>         if (reset) {
> -               char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> +               char *buf = kasprintf(GFP_ATOMIC, "%s:%llu;?:0",
>                                       table->name, table->handle);
>
>                 audit_log_nfcfg(buf,
>                                 family,
>                                 obj->handle,
> -                               AUDIT_NFT_OP_OBJ_RESET);
> +                               AUDIT_NFT_OP_OBJ_RESET,
> +                               GFP_KERNEL);
>                 kfree(buf);
>         }
>

Replaces one GFP_KERNEL (with GFP_ATOMIC) but also adds a new one in
the following statement.
Is that intentional?

> @@ -6156,7 +6163,7 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
>  {
>         struct sk_buff *skb;
>         int err;
> -       char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
> +       char *buf = kasprintf(gfp, "%s:%llu;?:0",
>                               table->name, table->handle);
>
>         audit_log_nfcfg(buf,
> @@ -6164,7 +6171,8 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
>                         obj->handle,
>                         event == NFT_MSG_NEWOBJ ?
>                                 AUDIT_NFT_OP_OBJ_REGISTER :
> -                               AUDIT_NFT_OP_OBJ_UNREGISTER);
> +                               AUDIT_NFT_OP_OBJ_UNREGISTER,
> +                       GFP_KERNEL);
>         kfree(buf);
>
>         if (!report &&

It would seem these two hunks form a similar discrepancy.

...

> --
> 1.8.3.1
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

