Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE77A13F6EF
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jan 2020 20:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579201706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DIc6NHQXPW60h5VLkkTktEfoXo1JL5BxGFWqwsaVjos=;
	b=YFooXi9xTrSw/2kxLJ7fVOKG9Z0jujozHLeuUg2qk4nyNPdgBw4FQwT1hNOzqwc5BDSsGP
	gvmifIOS71lREB+Lp3rCwSemMxJnykQLbTr29IPpVsK9HrkFtU6I8b8jpboqKUvpmIBV+T
	bwl/8+/eruoRpbdaxMj6FB/4KZ82qGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-V1ek_lZMMNyl5O9bQPeuQA-1; Thu, 16 Jan 2020 14:08:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A0B477;
	Thu, 16 Jan 2020 19:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF18C80890;
	Thu, 16 Jan 2020 19:08:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D1A518089CD;
	Thu, 16 Jan 2020 19:07:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GJ7kIm010245 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 14:07:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 239F22166B30; Thu, 16 Jan 2020 19:07:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E85C2166B2E
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 19:07:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0135802834
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 19:07:41 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-wbc_w5K9POiscXD_BkoLgw-1; Thu, 16 Jan 2020 14:07:40 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so16385613lfl.9
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 11:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EmuC4PVZIAqszrVr1XV69xZ8ppUgqhM55b6dhWz3+uk=;
	b=LiGkTgudvdjVqvXSDZEE1ZDAX4AbWkjK0DlSb1t+3XTQIAJL5EFH8s//iQQEgNDoBJ
	eNJ3fL4yaBnWlzS7bfOnaGTiKzIQRfujY0gz1HlEEFhPHNBTqTrCiC9qmpNAqmXMmrX6
	VtMne+0dM8xprKFHqsxdLLhJz7Z9R89aUPSUnLZmbvGb8Lan5GvzMryq9YaSIKJka+ID
	34Fxd7x3oS/O3L8WwLjQwwsbikjTYC0nvpoxCn0ewZm08XvPvLWInMT2lgY8/Xnr93zf
	bLqQURO5XOMIibbUAXUwzcEtJNHFeLYy3iUL9x50qNg2cLFEjeI2Y+CpgPbCGGVu3c07
	deFQ==
X-Gm-Message-State: APjAAAWb9vHanZnYH64XB0Hj47UV7wt0DqsVuxAioWLzrchm0uJIIfvo
	uTJrSiGcxMvoJjeRo1flrFiEEDinhOmynTcWx/Eg
X-Google-Smtp-Source: APXvYqyjq8pmunQfve4JqN7h2RHW+MxQZLns1p+JMhm7APFS43fUdBdBp+Ertu9yeaZgxNoNEEToXqGpX1HrNrUdodI=
X-Received: by 2002:a2e:870b:: with SMTP id m11mr3237458lji.93.1579201657915; 
	Thu, 16 Jan 2020 11:07:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<20200116150518.gfmzixoqagmk77rw@salvia>
In-Reply-To: <20200116150518.gfmzixoqagmk77rw@salvia>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 16 Jan 2020 14:07:27 -0500
Message-ID: <CAHC9VhSowSdhwaGNVfj-Paj7=38z1D-p+=EDQNUAwNJpO_tyXg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 0/9] Address NETFILTER_CFG issues
To: Pablo Neira Ayuso <pablo@netfilter.org>
X-MC-Unique: wbc_w5K9POiscXD_BkoLgw-1
X-MC-Unique: V1ek_lZMMNyl5O9bQPeuQA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00GJ7kIm010245
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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

On Thu, Jan 16, 2020 at 10:05 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Mon, Jan 06, 2020 at 01:54:01PM -0500, Richard Guy Briggs wrote:
> > There were questions about the presence and cause of unsolicited syscall events
> > in the logs containing NETFILTER_CFG records and sometimes unaccompanied
> > NETFILTER_CFG records.
> >
> > During testing at least the following list of events trigger NETFILTER_CFG
> > records and the syscalls related (There may be more events that will trigger
> > this message type.):
> >       init_module, finit_module: modprobe
> >       setsockopt: iptables-restore, ip6tables-restore, ebtables-restore
> >       unshare: (h?)ostnamed
> >       clone: libvirtd
> >
> > The syscall events unsolicited by any audit rule were found to be caused by a
> > missing !audit_dummy_context() check before creating a NETFILTER_CFG
> > record and issuing the record immediately rather than saving the
> > information to create the record at syscall exit.
> > Check !audit_dummy_context() before creating the NETFILTER_CFG record.
> >
> > The vast majority of unaccompanied records are caused by the fedora default
> > rule: "-a never,task" and the occasional early startup one is I believe caused
> > by the iptables filter table module hard linked into the kernel rather than a
> > loadable module. The !audit_dummy_context() check above should avoid them.
> >
> > A couple of other factors should help eliminate unaccompanied records
> > which include commit cb74ed278f80 ("audit: always enable syscall
> > auditing when supported and audit is enabled") which makes sure that
> > when audit is enabled, so automatically is syscall auditing, and ghak66
> > which addressed initializing audit before PID 1.
> >
> > Ebtables module initialization to register tables doesn't generate records
> > because it was never hooked in to audit.  Recommend adding audit hooks to log
> > this.
> >
> > Table unregistration was never logged, which is now covered.
> >
> > Seemingly duplicate records are not actually exact duplicates that are caused
> > by netfilter table initialization in different network namespaces from the same
> > syscall.  Recommend adding the network namespace ID (proc inode and dev)
> > to the record to make this obvious (address later with ghak79 after nsid
> > patches).
> >
> > See: https://github.com/linux-audit/audit-kernel/issues/25
> > See: https://github.com/linux-audit/audit-kernel/issues/35
> > See: https://github.com/linux-audit/audit-kernel/issues/43
> > See: https://github.com/linux-audit/audit-kernel/issues/44
>
> What tree is this batch targeted to?

I believe Richard was targeting this for the audit tree.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

