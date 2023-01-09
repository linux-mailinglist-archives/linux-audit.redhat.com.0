Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECF662E21
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 19:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673287636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZWCdm5/ceaI3JriaUA+/2lVeUkIxFyhUR8Z/qkGOOhg=;
	b=Da2GScv98srXY+TdmGorNhwn3UMaTfeYgdeyAJDAl3xhq/llYVmxTHCOxkOEdgovud+E1t
	DCbABCfVlsUj4zqb/lMP6UTmaslZTQklqRg2/acdeN98znT4DjbKU6TYZVeklcOt3JF+v2
	kAtyR58rhEyuPWmrVGmcFQFwjuPjHkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-vEDmStTlPgCMHGkZquqzkQ-1; Mon, 09 Jan 2023 13:07:14 -0500
X-MC-Unique: vEDmStTlPgCMHGkZquqzkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C57A9101A55E;
	Mon,  9 Jan 2023 18:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1174078906;
	Mon,  9 Jan 2023 18:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EAF81949761;
	Mon,  9 Jan 2023 18:07:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A38501946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 18:04:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95E0D492C18; Mon,  9 Jan 2023 18:04:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DC2C492C14
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 18:04:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33ADB18E0A8B
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 18:04:08 +0000 (UTC)
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-HjMe9HvJP4Sruyx0Fa_VGQ-1; Mon, 09 Jan 2023 13:04:06 -0500
X-MC-Unique: HjMe9HvJP4Sruyx0Fa_VGQ-1
Received: by mail-pl1-f201.google.com with SMTP id
 p15-20020a170902a40f00b00192b2bbb7f8so6790038plq.14
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 10:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=trG36qMQ9Re5MPDk2HW7Rz6kxqCJt0NIEgnLH9yO4Qo=;
 b=BPQbw0ZROiuEqI5VrgEQJZrDnnhGSGWzfj/QqNuvroyCPT0l4FrklcgiU3zv34RuYO
 OH5IOWoCKLK8Ypq2brrRTSqM7MpbGCLBpRzrVuAgv4WYsmIpIiQf9AvyxY/i8qmmT0+s
 WN3IC91MSYgKrdlelzcKuC3cbiq2OBxc077qEauFV050PyQukGKXJwWqpsO2pwrSmz6P
 g5mXSss95+z0mwSav7QCLbKGB6+P/fho7RTF3SgIVB2rJ83s3WPFGaZEwi2PIdK42sOf
 KUvrQ1Mtkn6u0cglVFJU0mNllA0/I8uiXptVORBj4SH6DtkmPTXtCDCeuzx5xxquk7bm
 dvFQ==
X-Gm-Message-State: AFqh2kqJmfzOzkHUcokdau/66TOLMLn5nS/H2Y7PlZcDNGXxWXpQHVgN
 Bi4GTNcFZS7eRS/I56YOemrfAQY=
X-Google-Smtp-Source: AMrXdXvQAaSeLP8emdOQH4MJhf2F47/Fz7kLXToAn5bywJRXLQq7tIYxXrN2/Tv/EdBrmXZS7cufits=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:aa7:8c18:0:b0:588:3aa8:bd95 with SMTP id
 c24-20020aa78c18000000b005883aa8bd95mr364514pfd.14.1673287445067; Mon, 09 Jan
 2023 10:04:05 -0800 (PST)
Date: Mon, 9 Jan 2023 10:04:03 -0800
In-Reply-To: <CAHC9VhTzBP49x3EH6yeqYxnr4jgcS6RdcvtbX_BSuRJnCH6ypQ@mail.gmail.com>
Mime-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <CAKH8qBtyR20ZWAc11z1-6pGb3Hd47AQUTbE_cfoktG59TqaJ7Q@mail.gmail.com>
 <CAHC9VhTzBP49x3EH6yeqYxnr4jgcS6RdcvtbX_BSuRJnCH6ypQ@mail.gmail.com>
Message-ID: <Y7xXEx5NEV96fnPp@google.com>
Subject: Re: [PATCH v3 1/2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
From: sdf@google.com
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:07:10 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"

On 01/09, Paul Moore wrote:
> On Fri, Jan 6, 2023 at 2:45 PM Stanislav Fomichev <sdf@google.com> wrote:
> > On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
> > >
> > > When changing the ebpf program put() routines to support being called
> > > from within IRQ context the program ID was reset to zero prior to
> > > calling the perf event and audit UNLOAD record generators, which
> > > resulted in problems as the ebpf program ID was bogus (always zero).
> > > This patch addresses this problem by removing an unnecessary call to
> > > bpf_prog_free_id() in __bpf_prog_offload_destroy() and adjusting
> > > __bpf_prog_put() to only call bpf_prog_free_id() after audit and perf
> > > have finished their bpf program unload tasks in
> > > bpf_prog_put_deferred().  For the record, no one can determine, or
> > > remember, why it was necessary to free the program ID, and remove it
> > > from the IDR, prior to executing bpf_prog_put_deferred();
> > > regardless, both Stanislav and Alexei agree that the approach in this
> > > patch should be safe.
> > >
> > > It is worth noting that when moving the bpf_prog_free_id() call, the
> > > do_idr_lock parameter was forced to true as the ebpf devs determined
> > > this was the correct as the do_idr_lock should always be true.  The
> > > do_idr_lock parameter will be removed in a follow-up patch, but it
> > > was kept here to keep the patch small in an effort to ease any stable
> > > backports.
> > >
> > > I also modified the bpf_audit_prog() logic used to associate the
> > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > Instead of keying off the operation, it now keys off the execution
> > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > appropriate and should help better connect the UNLOAD operations with
> > > the associated audit state (other audit records).
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from  
> irq context.")
> > > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > > Suggested-by: Stanislav Fomichev <sdf@google.com>
> > > Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> > > Signed-off-by: Paul Moore <paul@paul-moore.com>
> >
> > Acked-by: Stanislav Fomichev <sdf@google.com>
> >
> > Thank you! There might be a chance it breaks test_offload.py (I don't
> > remember whether it checks this prog-is-removed-from-id part or not),
> > but I don't think it's fair to ask to address it :-)
> > Since it doesn't trigger in CI, I'll take another look next week when
> > doing a respin of my 'xdp-hints' series.

> No problem, I'm glad we found a solution that works for everyone; and
> thank you for chasing down any test changes that may be necessary.

> I'd like to get this patch into Linus' tree sooner rather than later
> as it fixes a kinda ugly problem, would you be okay if this went in
> via the bpf tree?  With the appropriate ACKs I could send it to Linus
> via the audit tree, but I think it would be much better to send it via
> the bpf/netdev tree.

Don't see any reason that this should go via bpf-next, so assuming
going via bpf three should be fine.


> --
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

