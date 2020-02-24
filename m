Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 69CE916B4AA
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582584973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WeMrX0GSWXkgnJ/0PMvJAPy3dBlPGwaobT2Nzq5WZek=;
	b=EpRWTWwY07HLJcTfnbIKOJf/zqYFB8ZL3akEx9+wqFKiaTdIiMGT0OefMfff0JnxwAoIjH
	Ws14piTrXgx2sl7bwoFnbr5DQ/KPZFPPSKLdCLmoERzRqVpEEe6bMXGOsUjZ5epCYbl8sX
	hWWDJYslkQezAtUlAKwpxZMdZwExeKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-txsBoKZJNS2e-pVtsLflvw-1; Mon, 24 Feb 2020 17:56:10 -0500
X-MC-Unique: txsBoKZJNS2e-pVtsLflvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB75800EB4;
	Mon, 24 Feb 2020 22:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77CB5C21B;
	Mon, 24 Feb 2020 22:56:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55E2B18089C8;
	Mon, 24 Feb 2020 22:56:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMu0BV024849 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:56:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3E34100320D; Mon, 24 Feb 2020 22:56:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA711004C6C
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:55:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1790800260
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:55:58 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-285-w1SBHF-MNqGNKbWcf04AJg-1; Mon, 24 Feb 2020 17:55:56 -0500
X-MC-Unique: w1SBHF-MNqGNKbWcf04AJg-1
Received: by mail-ed1-f65.google.com with SMTP id e10so13891574edv.9
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=sYS0u8WziXPKM/ft9vXFlVqxwav5gk7o1BSqZuT75HU=;
	b=OwhogLM4qlUHiXpTHpKyCtfxRwmiBkNV0MwAFQpZ3wXGpP9M/B+/3zAvkLi8XZQvbx
	PaVMkQXsfaG+YwPfeV2Vd40wFw7ua5woRJqZJmUPZ+e+3Zb1R4BTRi6pXWz8X+GcXi83
	5WJxZ35ITYhw8xFZxSFS1GNYt+uM6i5VRinzDbHyrmwwQZ0mNembWRzifUF5puG25q2M
	mSf7mwtQdM3oGFLGP1E51fCAzCclun1HucILi/q6uoByFodwP+6PT9G/oTUV1xrBFogb
	2VUauJFr5qC0cLPvuXqdcoh/MMaZxB1WSHs0VkG9M/4ox04f1vy7zj5U4B64FY+iv8d8
	dtdQ==
X-Gm-Message-State: APjAAAWngDgt85rWWTmBvC2uNLQLH9nLHI2Ymb5EIpcwAb2QWowRj1AD
	CdLCu838RuO1cKepUAvYF7OBQTs4uFHvhylpVzGzh84=
X-Google-Smtp-Source: APXvYqyzgPbDU/QQ0HlvjwIdX8g8bA4hNtLB+K4gUNoY0rDaM5zvcQh67dmKm5qx0oYz7f9mDMqkveEIRHnjRslg/gg=
X-Received: by 2002:a05:6402:309b:: with SMTP id
	de27mr32198754edb.269.1582584954608; 
	Mon, 24 Feb 2020 14:55:54 -0800 (PST)
MIME-Version: 1.0
References: <158258480936.525901.8492820711796738271.stgit@chester>
In-Reply-To: <158258480936.525901.8492820711796738271.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 17:55:43 -0500
Message-ID: <CAHC9VhTm=WdF8=o22BRC2CD9-BerQ_NdzeHeoZxZp6tmf73oHA@mail.gmail.com>
Subject: Re: [PATCH] audit: always check the netlink payload length in
	audit_receive_msg()
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMu0BV024849
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 5:53 PM Paul Moore <paul@paul-moore.com> wrote:
> This patch ensures that we always check the netlink payload length
> in audit_receive_msg() before we take any action on the payload
> itself.
>
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com
> Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/audit.c |   43 +++++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 17b0d523afb3..6e8b176bdb68 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1314,11 +1314,14 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                 if (err)
>                         return err;
>                 break;
> -       case AUDIT_SET_FEATURE:
> -               err = audit_set_feature(skb);
> +       case AUDIT_SET_FEATURE: {
> +               if (data_len < sizeof(struct audit_features))
> +                       return -EINVAL;
> +               err = audit_set_feature(data);
>                 if (err)
>                         return err;
>                 break;
> +       }

Ooops, these braces are an artifact from a previous revision.
Consider them removed.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

