Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CA20E13FB42
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jan 2020 22:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579209659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EMktrX2r1lobUzQlR1apQa2RcysbSQOCqi/gUByPvTA=;
	b=DDtTXO1LYWW7a2hU7xI68nFcZKgxMLTBBiU2+UO5+mlg5CgXQSIpJYd+cMjHUi0mEGPawS
	/sQilS+Zv1koT8huID5V22tVdfZr1QV5oUUtKa5eYp2UM1n3IdRy+7KPyT72BLdoFr3pQ3
	b58c1aD7QbYjxtKQJiWaPUEoPVlvFwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-ijTVyPc5NDKK3DVDp4Kk1g-1; Thu, 16 Jan 2020 16:20:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D665477;
	Thu, 16 Jan 2020 21:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F9E5C241;
	Thu, 16 Jan 2020 21:20:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F4A918089CD;
	Thu, 16 Jan 2020 21:20:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GLKahg016559 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 16:20:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E3B35C548; Thu, 16 Jan 2020 21:20:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED1B5C545;
	Thu, 16 Jan 2020 21:20:26 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:20:23 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v2 0/9] Address NETFILTER_CFG issues
Message-ID: <20200116212023.w2ylqqmf654hwuvq@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<20200116150518.gfmzixoqagmk77rw@salvia>
	<CAHC9VhSowSdhwaGNVfj-Paj7=38z1D-p+=EDQNUAwNJpO_tyXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSowSdhwaGNVfj-Paj7=38z1D-p+=EDQNUAwNJpO_tyXg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org, Pablo Neira Ayuso <pablo@netfilter.org>
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
X-MC-Unique: ijTVyPc5NDKK3DVDp4Kk1g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-16 14:07, Paul Moore wrote:
> On Thu, Jan 16, 2020 at 10:05 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > On Mon, Jan 06, 2020 at 01:54:01PM -0500, Richard Guy Briggs wrote:
> > > There were questions about the presence and cause of unsolicited syscall events
> > > in the logs containing NETFILTER_CFG records and sometimes unaccompanied
> > > NETFILTER_CFG records.
> > >
> > > During testing at least the following list of events trigger NETFILTER_CFG
> > > records and the syscalls related (There may be more events that will trigger
> > > this message type.):
> > >       init_module, finit_module: modprobe
> > >       setsockopt: iptables-restore, ip6tables-restore, ebtables-restore
> > >       unshare: (h?)ostnamed
> > >       clone: libvirtd
> > >
> > > The syscall events unsolicited by any audit rule were found to be caused by a
> > > missing !audit_dummy_context() check before creating a NETFILTER_CFG
> > > record and issuing the record immediately rather than saving the
> > > information to create the record at syscall exit.
> > > Check !audit_dummy_context() before creating the NETFILTER_CFG record.
> > >
> > > The vast majority of unaccompanied records are caused by the fedora default
> > > rule: "-a never,task" and the occasional early startup one is I believe caused
> > > by the iptables filter table module hard linked into the kernel rather than a
> > > loadable module. The !audit_dummy_context() check above should avoid them.
> > >
> > > A couple of other factors should help eliminate unaccompanied records
> > > which include commit cb74ed278f80 ("audit: always enable syscall
> > > auditing when supported and audit is enabled") which makes sure that
> > > when audit is enabled, so automatically is syscall auditing, and ghak66
> > > which addressed initializing audit before PID 1.
> > >
> > > Ebtables module initialization to register tables doesn't generate records
> > > because it was never hooked in to audit.  Recommend adding audit hooks to log
> > > this.
> > >
> > > Table unregistration was never logged, which is now covered.
> > >
> > > Seemingly duplicate records are not actually exact duplicates that are caused
> > > by netfilter table initialization in different network namespaces from the same
> > > syscall.  Recommend adding the network namespace ID (proc inode and dev)
> > > to the record to make this obvious (address later with ghak79 after nsid
> > > patches).
> > >
> > > See: https://github.com/linux-audit/audit-kernel/issues/25
> > > See: https://github.com/linux-audit/audit-kernel/issues/35
> > > See: https://github.com/linux-audit/audit-kernel/issues/43
> > > See: https://github.com/linux-audit/audit-kernel/issues/44
> >
> > What tree is this batch targeted to?
> 
> I believe Richard was targeting this for the audit tree.

Yes, sorry Pablo, it is against audit/next based on v5.5-rc1

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

