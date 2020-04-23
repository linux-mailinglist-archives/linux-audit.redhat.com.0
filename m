Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAB91B5D3E
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 16:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587650714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bi1q5sOj6VDlxsus30gHubl87RugUKRoWnmeN/HqidM=;
	b=MBtULiVObXmxLlmWaEcY0V5GWreMwFM2kmq0J5FeK86XIbdjV71wYl6pchpJZ23lXY+H/0
	WfVgJNbCI6aS/pZHAFGLTgONYGW35jl5cBkqK7N/W42uI1paiXTVZEMXFRTEwj/JA8bkcj
	+2jfWTOqq1SiN1SrFNi9mCg+N+G7748=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-T6_mFedjOi6VAPhPhrdVmA-1; Thu, 23 Apr 2020 10:05:11 -0400
X-MC-Unique: T6_mFedjOi6VAPhPhrdVmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78AC1835B67;
	Thu, 23 Apr 2020 14:05:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89AEB10246E7;
	Thu, 23 Apr 2020 14:05:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5157C1809542;
	Thu, 23 Apr 2020 14:05:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NE4svi004844 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 10:04:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B74E10CD2C1; Thu, 23 Apr 2020 14:04:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B6410CD2BF
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 14:04:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D41A18A6675
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 14:04:52 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-923mPyqYNgG5-fFF1VlhdQ-1; Thu, 23 Apr 2020 10:04:50 -0400
X-MC-Unique: 923mPyqYNgG5-fFF1VlhdQ-1
Received: by mail-ed1-f47.google.com with SMTP id f12so4369836edn.12
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 07:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KUpTzC31Qzxvu0Rt18ziH2KgMmYbclFZuZgJ/AlLJ6o=;
	b=PlIBkKlp4CeSoCh2ri7ZHji3bR9Oe9efqKy7wgoyEfhlYls3E4NllMWcnpIp+qrQOP
	QRgmBVPGOlOZGdnLF0RwXasruOY5WoGyrnbXJNW4ZNAv5VeJLNrQMw3x3ZlAEsX/wJUY
	0eOB10YS9cN4XnTsW3URm0I3sVprzXlDxwbz/d53wFq3jsvWUri/o1GIWFJpeZOv1J5k
	ljhEI17alXiC1x7y32haSC+s3etgNzUi44RH9Cw/PirYHL97r1eeGWGPtuhYA2oHOtPn
	NLKzR9lR75iB13x2sblfVJzWm89g+/Yb6I1mtnqOInQEuAxxwWliXSxFJrXr/HlPsHEh
	zyDA==
X-Gm-Message-State: AGi0PuZJ44hyn+s+NsxbwQANTMijWUsuegA2ENVYQ6URsM2HAIe+PTHc
	pCPP+A9OkJlmCHWeTMeabw2PlFkG3B+RYWvJ14kX
X-Google-Smtp-Source: APiQypLiSRj4w0Fu1hzK+c8jZB7B4vUEPg/l4n6DL7JJ9ChYZmKodU8OkvpAG3eAMkuu96PB+GgVVqBES51vmj/FerQ=
X-Received: by 2002:aa7:c401:: with SMTP id j1mr2697788edq.31.1587650688934;
	Thu, 23 Apr 2020 07:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
	<20200423073021.GA62700@gardel-login>
	<CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
	<20200423135743.GB63067@gardel-login>
In-Reply-To: <20200423135743.GB63067@gardel-login>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Apr 2020 10:04:37 -0400
Message-ID: <CAHC9VhTBiyO-u3X-CrLmdkPksbNPH5cAWSxhy-QHj_xrfSHPjg@mail.gmail.com>
Subject: Re: multicast listeners and audit events to kmsg
To: Lennart Poettering <lennart@poettering.net>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NE4svi004844
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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

On Thu, Apr 23, 2020 at 9:57 AM Lennart Poettering
<lennart@poettering.net> wrote:
> On Do, 23.04.20 09:50, Paul Moore (paul@paul-moore.com) wrote:
> > > > If systemd enables the audit stream, and doesn't want the stream to
> > > > flood kmsg, it needs to make sure that the stream is directed to a
> > > > suitable sink, be it auditd or some other daemon.
> > >
> > > This sounds as if journald should start using the unicast stream. This
> > > basically means auditd is out of the game, and cannot be added in
> > > anymore, because the unicast stream is then owned by journald. It
> > > wouldn't be sufficient to just install the audit package to get
> > > classic audit working anymore. You'd have to reconfigure everything.
> > >
> > > I mean, we try to be non-intrusive, not step into your territory too
> > > much, not replace auditd, not kick auditd out of the game. But you are
> > > basically telling us to do just that?
> >
> > My recommendation is that if you are going to enable audit you should
> > also ensure that auditd is running; that is what I'm telling you.
>
> Well, that's the "audit is my private kingdom" response, right?

When you can respond without making inflammatory comments such as
those above, let me know.

> People are interested in collecting the audit stream without having
> the full audit daemon installed. There's useful data in the audit
> stream, already generated during really early boot, long before auditd
> runs, i.e. in the initrd. And for smaller systems auditd is not really
> something people want around.
>
> For example, Fedora CoreOS wants to enable selinux, thus is interested
> in audit messages, but have no intention to install auditd, in the
> typical, minimal images they generate. See:
>
> https://github.com/systemd/systemd/issues/15324
>
> Lennart
>
> --
> Lennart Poettering, Berlin

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

