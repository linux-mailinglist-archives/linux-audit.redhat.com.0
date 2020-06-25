Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF9120A40E
	for <lists+linux-audit@lfdr.de>; Thu, 25 Jun 2020 19:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593106279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wWsoR+/bpLAtEmCGE7KW8dtupESJH+xMBrrISYkYuYs=;
	b=QdT2Sxl+5eBW9VW5rJ5jeB/Nas1rrEsiuF7Ui70NVO2Qm5YwBkgpq6jK5EuzTqj+2gFnbv
	CPN2tafy3VB696wFhu0wcdptc6wrCB/z050psiL1W0yCFrocEIhDiP1pgOi3e8VCAsCmHW
	rIg14Aons9fDPm1EUvQxVYq7yr9LJ1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-d_8IeLgFMuedWIXotj41VA-1; Thu, 25 Jun 2020 13:31:14 -0400
X-MC-Unique: d_8IeLgFMuedWIXotj41VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48D2310059A6;
	Thu, 25 Jun 2020 17:31:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE6685C296;
	Thu, 25 Jun 2020 17:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31FC61809547;
	Thu, 25 Jun 2020 17:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PHUlKP027087 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 13:30:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 002932144B58; Thu, 25 Jun 2020 17:30:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2AD22144B4F
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 17:30:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5CE78007CB
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 17:30:43 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-b8marANSMdmSAfF0OtAAxw-1; Thu, 25 Jun 2020 13:30:41 -0400
X-MC-Unique: b8marANSMdmSAfF0OtAAxw-1
Received: by mail-ot1-f68.google.com with SMTP id 5so4013872oty.11
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 10:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pvzhe11VKECITwUQ1Xlnc30c+o3QDKAmXI3wMhF+/zM=;
	b=UNrD1zOB/w9lBcoPE0EjA9Sh1r4imtaTh4zwsaZeLXBMWJjZdB67T7sgO3lrR6OHsy
	fsWYjTYSWJqRl55z3iCe3a9QVx9mbmGiTTnnexQ00gYbeljGYtkdBd7NkIUuNYKI+Rpm
	kHUWJ4oQapZ/dRyVPg86Ura3rNea5VZldwvNhG2k0trkMycNXXTqVgEktpP2HMO5Vx/7
	VSEUVLA1FkQHjFvYDH+q1ifBja1iykwl1GtGMwzxwpy2g/CVaztDic5tm4fg/1n3m2VB
	ib7BufBl27TGS0h4yvKce2wMpszEMsAS7FFvZsS9mxJfqWb8iTT9Qa9Iz+wmjn0kcacK
	xT8Q==
X-Gm-Message-State: AOAM532glZdMSvwZFvEmcAEZMhowXHsTwnyBg7xKDYD7pxeHlgLXtZ09
	9g+Q73cXzQ5qiBHAiBvO8SIyJvGR+J/SKEohnwU=
X-Google-Smtp-Source: ABdhPJygO7aFdL4mUp8YfxWc1wMQGXVU+NkeCuWiDyC16R3zdkYviNCw4M8ty9ag+VdzuY8O6DbtaUcVpP1voBhhuZg=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr13972173oth.135.1593106240666; 
	Thu, 25 Jun 2020 10:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200605081952.16278-1-toiwoton@gmail.com>
	<CAEjxPJ50YNJViUUA=7jaLwzPDMJUE0xzegAes4YF=TwpAo88YQ@mail.gmail.com>
	<CAEjxPJ6eevd1JOQN_8yC1SyQWoqPwkBvGJDu=ju+Dpku666KhQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ6eevd1JOQN_8yC1SyQWoqPwkBvGJDu=ju+Dpku666KhQ@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 25 Jun 2020 13:30:29 -0400
Message-ID: <CAEjxPJ4Sk-DYg=cByfkcUOs+YvyQPSj8nh=3-DWJOQyfbMO+XQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 22, 2020 at 8:22 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Mon, Jun 8, 2020 at 12:18 PM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > On Fri, Jun 5, 2020 at 4:24 AM Topi Miettinen <toiwoton@gmail.com> wrote:
> > >
> > > At least on Debian, /etc/protocols, which is used by
> > > socket.getprotobyname() to resolve protocols to names, does not
> > > contain an entry for "ipv4". In that case, set the protocol number
> > > used by audit logs for "ipv4" to a fixed value. To ensure audit log
> > > compatibility, let's use the same numeric value as Fedora: 4, which is
> > > actually understood by kernel as IP over IP.
> > >
> > > Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
> >
> > This looks fine to me but adding linux-audit mailing list to see if
> > they have any concerns.  It appears to make no change to the audit
> > messages on Fedora.
>
> Seeing no objections from linux-audit,
>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

Applied.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

