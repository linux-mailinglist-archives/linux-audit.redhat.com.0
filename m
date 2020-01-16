Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9701613DE55
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jan 2020 16:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579187607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rKyRveazXnWcOTz9zqK4iuBH+qyuJfcZdq9lJeo3D04=;
	b=bfAvkmjPqWNhDMh5HYkNsD89LzpLnT4hVABcKrKLbMOqWuUeI1hOJo5XFZxJJp2TCybwAc
	E0IHy5Ts8MDPKmwITi4yYUGYzvLNFlOJzsPNC6ttOveGY31gJAR/JFCBbTXowg3ghE1Vnw
	09AIChhRVC3S48cVEeY1xJFH8h1PaiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-XSFLZcW6MMmvQZ_KUVcd_g-1; Thu, 16 Jan 2020 10:13:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F6C800D41;
	Thu, 16 Jan 2020 15:13:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A22A5D9C9;
	Thu, 16 Jan 2020 15:13:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E6BB18034EA;
	Thu, 16 Jan 2020 15:13:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GF5Uv6024050 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 10:05:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 199442026D68; Thu, 16 Jan 2020 15:05:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1445E2026D67
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 15:05:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D66802834
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 15:05:27 +0000 (UTC)
Received: from mail.us.es (correo.us.es [193.147.175.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-91-tqgC-MjWOZ2wkm_kHVvEmw-1;
	Thu, 16 Jan 2020 10:05:23 -0500
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id 8B120508CD3
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 16:05:21 +0100 (CET)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 7BD5FDA78C
	for <linux-audit@redhat.com>; Thu, 16 Jan 2020 16:05:21 +0100 (CET)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
	id 7186EDA72A; Thu, 16 Jan 2020 16:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
	SMTPAUTH_US2,USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 0FDC6DA712;
	Thu, 16 Jan 2020 16:05:19 +0100 (CET)
Received: from 192.168.1.97 (192.168.1.97)
	by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int); 
	Thu, 16 Jan 2020 16:05:19 +0100 (CET)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: 1984lsi)
	by entrada.int (Postfix) with ESMTPSA id DADC342EF9E1;
	Thu, 16 Jan 2020 16:05:18 +0100 (CET)
Date: Thu, 16 Jan 2020 16:05:18 +0100
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 0/9] Address NETFILTER_CFG issues
Message-ID: <20200116150518.gfmzixoqagmk77rw@salvia>
References: <cover.1577830902.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: ClamAV using ClamSMTP
X-MC-Unique: tqgC-MjWOZ2wkm_kHVvEmw-1
X-MC-Unique: XSFLZcW6MMmvQZ_KUVcd_g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00GF5Uv6024050
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 16 Jan 2020 10:12:58 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 06, 2020 at 01:54:01PM -0500, Richard Guy Briggs wrote:
> There were questions about the presence and cause of unsolicited syscall events
> in the logs containing NETFILTER_CFG records and sometimes unaccompanied
> NETFILTER_CFG records.
> 
> During testing at least the following list of events trigger NETFILTER_CFG
> records and the syscalls related (There may be more events that will trigger
> this message type.):
> 	init_module, finit_module: modprobe
> 	setsockopt: iptables-restore, ip6tables-restore, ebtables-restore
> 	unshare: (h?)ostnamed
> 	clone: libvirtd
> 
> The syscall events unsolicited by any audit rule were found to be caused by a
> missing !audit_dummy_context() check before creating a NETFILTER_CFG
> record and issuing the record immediately rather than saving the
> information to create the record at syscall exit.
> Check !audit_dummy_context() before creating the NETFILTER_CFG record.
> 
> The vast majority of unaccompanied records are caused by the fedora default
> rule: "-a never,task" and the occasional early startup one is I believe caused
> by the iptables filter table module hard linked into the kernel rather than a
> loadable module. The !audit_dummy_context() check above should avoid them.
> 
> A couple of other factors should help eliminate unaccompanied records
> which include commit cb74ed278f80 ("audit: always enable syscall
> auditing when supported and audit is enabled") which makes sure that
> when audit is enabled, so automatically is syscall auditing, and ghak66
> which addressed initializing audit before PID 1.
> 
> Ebtables module initialization to register tables doesn't generate records
> because it was never hooked in to audit.  Recommend adding audit hooks to log
> this.
> 
> Table unregistration was never logged, which is now covered.
> 
> Seemingly duplicate records are not actually exact duplicates that are caused
> by netfilter table initialization in different network namespaces from the same
> syscall.  Recommend adding the network namespace ID (proc inode and dev)
> to the record to make this obvious (address later with ghak79 after nsid
> patches).
> 
> See: https://github.com/linux-audit/audit-kernel/issues/25
> See: https://github.com/linux-audit/audit-kernel/issues/35
> See: https://github.com/linux-audit/audit-kernel/issues/43
> See: https://github.com/linux-audit/audit-kernel/issues/44

What tree is this batch targeted to?

Thanks.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

