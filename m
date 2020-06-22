Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5150D2036A6
	for <lists+linux-audit@lfdr.de>; Mon, 22 Jun 2020 14:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592828609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E+vIBhXMYjgABvFmiNCIMh7Av9N6DasoQq49746mz2I=;
	b=TmQ08Y6CmdNXM0bAHMQ3v7YFVyNAn7D8TZiU9Jr8apBxsfY1X+3+6/EZP5AB4PhVlTQujL
	UDg7Q9V1HT1kgXHNl1QK6pVC/7ApkZILe5EIF7SuLOAunNkr1k/8t5ZzB2shNgmlwfBdHJ
	SNW7jLhEp7vc62YuhFt0AgNpJLKUrzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Q12JUi42NZeG2SL0el2cNA-1; Mon, 22 Jun 2020 08:23:27 -0400
X-MC-Unique: Q12JUi42NZeG2SL0el2cNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3549800053;
	Mon, 22 Jun 2020 12:23:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 223FD100238C;
	Mon, 22 Jun 2020 12:23:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8136833A4;
	Mon, 22 Jun 2020 12:23:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05MCN5r1029098 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 08:23:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C2312156A50; Mon, 22 Jun 2020 12:23:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 081022157F23
	for <linux-audit@redhat.com>; Mon, 22 Jun 2020 12:23:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF86D85A5B1
	for <linux-audit@redhat.com>; Mon, 22 Jun 2020 12:23:01 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-mSZsit_uOHeLdqmWloKFWQ-1; Mon, 22 Jun 2020 08:22:59 -0400
X-MC-Unique: mSZsit_uOHeLdqmWloKFWQ-1
Received: by mail-oi1-f195.google.com with SMTP id 25so15387246oiy.13
	for <linux-audit@redhat.com>; Mon, 22 Jun 2020 05:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6JmRDLvA6IDf6PM049iwGUzvnXARRdvQNLAIdRISzE0=;
	b=XLdaZiIaz0FDQzHKXSSfMv9aI5reKWKxL1p1GY3h6BggR4bbNEtxRRYiHhxQGh8Tfr
	G33BIaypqzvMOaIsEgyMoTAioGdW2n3QZRVWZiVgVh6zqNba6XQXX6DxGbNPASSaJCOs
	gX9f+/spcmH6ptmBP+fWQjeFgLBezSIcwu+PlDpGJ2hjzGqQRqp75nkl05tg/w5taBgB
	jHalxpVlQwA1+BQoVToXXUUjS3Etl2lDO2Xf6G/yI43HM02T1KhYI7/ejZRN5aPAS830
	9sAYQ9kHyNTriMtjYUCJw97lWRBPAyTRyLX6YjzRwVtELPcrc2MbGT2IyVgX8T8O+8Wy
	jXUA==
X-Gm-Message-State: AOAM533HueCvWwBnS8PT69P4jVyh+k4juWEz44jwE1Uin9QUsMn2or7b
	Ro2WJzUcs3LezIFlfKvDBEOu+Bm2c9OdusYFzBU=
X-Google-Smtp-Source: ABdhPJwZ5J2/2Rjq+lBQzOkPAQCqJjGRqvvgR/Sqtru9YVgT11uuwi89OIzUq2XKFOR8GOtqIwv0tGo/ITq2NoIwuVI=
X-Received: by 2002:aca:3283:: with SMTP id
	y125mr12326202oiy.140.1592828578853; 
	Mon, 22 Jun 2020 05:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200605081952.16278-1-toiwoton@gmail.com>
	<CAEjxPJ50YNJViUUA=7jaLwzPDMJUE0xzegAes4YF=TwpAo88YQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ50YNJViUUA=7jaLwzPDMJUE0xzegAes4YF=TwpAo88YQ@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 22 Jun 2020 08:22:48 -0400
Message-ID: <CAEjxPJ6eevd1JOQN_8yC1SyQWoqPwkBvGJDu=ju+Dpku666KhQ@mail.gmail.com>
Subject: Re: [PATCH v2] semanage: handle getprotobyname() failure case
To: Topi Miettinen <toiwoton@gmail.com>, linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 8, 2020 at 12:18 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Fri, Jun 5, 2020 at 4:24 AM Topi Miettinen <toiwoton@gmail.com> wrote:
> >
> > At least on Debian, /etc/protocols, which is used by
> > socket.getprotobyname() to resolve protocols to names, does not
> > contain an entry for "ipv4". In that case, set the protocol number
> > used by audit logs for "ipv4" to a fixed value. To ensure audit log
> > compatibility, let's use the same numeric value as Fedora: 4, which is
> > actually understood by kernel as IP over IP.
> >
> > Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
>
> This looks fine to me but adding linux-audit mailing list to see if
> they have any concerns.  It appears to make no change to the audit
> messages on Fedora.

Seeing no objections from linux-audit,

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

