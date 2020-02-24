Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 587C316B4B7
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582585166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uISaWxEx+Z6hLh1hVXjhpHKwy+uGtcOtje9HkzW7WWI=;
	b=SvvNdIEJwiVX+Et2SFGJTkaT0KCC/aN8H6g4sbgfUb6dfy9nMpqorTj12vBmLnRI1Gtiec
	fcxbST7lTQExRjQqh1LTZaA7DEwg2XZEfOh0UM38H11ib201c+W0RhIR6Ww3ZeSWq4WwKW
	CS0p92m92ztzrWU31P4VV+x2a/BdB2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-xM4xssV-PRKNITNTwea9fg-1; Mon, 24 Feb 2020 17:59:23 -0500
X-MC-Unique: xM4xssV-PRKNITNTwea9fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553801005512;
	Mon, 24 Feb 2020 22:59:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9AE90F5B;
	Mon, 24 Feb 2020 22:59:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16C07860F1;
	Mon, 24 Feb 2020 22:59:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMxCPK025106 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:59:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A93CA2026D68; Mon, 24 Feb 2020 22:59:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A40622026D67
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:59:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73BED101A55E
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:59:10 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-alHJyPSCPAK6Fwvb8UH2Sw-1; Mon, 24 Feb 2020 17:59:08 -0500
X-MC-Unique: alHJyPSCPAK6Fwvb8UH2Sw-1
Received: by mail-ed1-f68.google.com with SMTP id v28so13895527edw.12
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=uqyY8kIx1xCI/PptFUA6MulvryIXOwjfPwT/Y+MhE9U=;
	b=WYiLZOS6EnPwItZ/XNxIPJWZz9+3qJMcp8/9MiZQqOpOp49Q/SqraGcd7nja22VwLn
	uuwK3wzWRPrFjRwl+rVJ/1OP+uQSCs5XnJoIxw7srGnBekWhmvyx3aaMpHJjZ1ehiuPm
	UKogKp+BsjkfC8GGGAnzLmj0bq6wwlrPnFKZjws9wXALGL4KSFGgAjYZjGh47ZpJfuu9
	8DTW9xXbPD1a88cLUq5r8Ph0GsbHceIV1sVYuuJ2K+laUeaKoM++BjGkaL9W0SOGq2K3
	aKguSvsWTxtomMCdByuYJx4RO2A+RIZ4yA9zrcee9v4lpOh1qEVy48v0/Au12cTSAg4p
	U7Ew==
X-Gm-Message-State: APjAAAUO9OzkmO+oZKaN+oWw8mG8ePfUdbRrXnPqPCRW1USguVLPidf7
	AQRlbW4YCPpDwcFpOlKO4BKYEl45CveyJFyDBrmtJYg=
X-Google-Smtp-Source: APXvYqxOW13N0Ub5QB9nUFIGV8BcPNcUwIe12mdUIL2scOKKtQTex1aIdBIWHHv+drrxcVqU7py0ldr1JYrVjpYiloA=
X-Received: by 2002:a17:906:c299:: with SMTP id
	r25mr50105752ejz.272.1582585146558; 
	Mon, 24 Feb 2020 14:59:06 -0800 (PST)
MIME-Version: 1.0
References: <158258480936.525901.8492820711796738271.stgit@chester>
In-Reply-To: <158258480936.525901.8492820711796738271.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 17:58:54 -0500
Message-ID: <CAHC9VhRd_QGp4KoOait-=UPtQeDi_vkgT=NrSOK2+tq1z8HTaw@mail.gmail.com>
Subject: Re: [PATCH] audit: always check the netlink payload length in
	audit_receive_msg()
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMxCPK025106
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

On Mon, Feb 24, 2020 at 5:53 PM Paul Moore <paul@paul-moore.com> wrote:
>
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
> @@ -1334,26 +1339,24 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                                         break;
>                         }
>                         audit_log_user_recv_msg(&ab, msg_type);
> -                       if (msg_type != AUDIT_USER_TTY)
> +                       if (msg_type != AUDIT_USER_TTY) {
> +                               /* ensure NULL termination */
> +                               str[data_len - 1] = '\0';
>                                 audit_log_format(ab, " msg='%.*s'",
>                                                  AUDIT_MESSAGE_TEXT_MAX,
> -                                                (char *)data);
> -                       else {
> -                               int size;
> -
> +                                                str);
> +                       } else {
>                                 audit_log_format(ab, " data=");
> -                               size = nlmsg_len(nlh);
> -                               if (size > 0 &&
> -                                   ((unsigned char *)data)[size - 1] == '\0')
> -                                       size--;
> -                               audit_log_n_untrustedstring(ab, data, size);
> +                               if (data_len > 0 && str[data_len - 1] == '\0')
> +                                       data_len--;
> +                               audit_log_n_untrustedstring(ab, data, data_len);
                                                                  ^^^^
... and it looks like I didn't properly refresh my patch before
sending, the second arg in the line above is "str" not "data".

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

