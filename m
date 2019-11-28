Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1379510CA62
	for <lists+linux-audit@lfdr.de>; Thu, 28 Nov 2019 15:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574951449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D0As6vniPsu2lvGwJBHtJYjeYb1VwZCkY+VaEVjml1k=;
	b=C8mFEx1TkjXdbcxQoPZDASTOTwYM34NdoHNLaCfKKErLMoMnXcVBGOOntohnt1C0+1smWz
	RWE7fjcmAnlrJcz3YyA5dZNMjQOq7i/wmQiUZ4OyWuPb5QocyVMeW8Ay/FptasfEHqWsNm
	YLhBEtxpnHpwrWU6tLzAdvCaYTeRik4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41--JKGir4KPmqgYLLx82iArw-1; Thu, 28 Nov 2019 09:30:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06EBF101F7CD;
	Thu, 28 Nov 2019 14:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0A15D6D6;
	Thu, 28 Nov 2019 14:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47C0D1819AC0;
	Thu, 28 Nov 2019 14:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAS9IIdV025330 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 28 Nov 2019 04:18:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F22CC5DA70; Thu, 28 Nov 2019 09:18:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with SMTP id B84EE5D9E1;
	Thu, 28 Nov 2019 09:18:12 +0000 (UTC)
Date: Thu, 28 Nov 2019 10:18:12 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Jiri Olsa <jolsa@kernel.org>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191128091812.GC1209@krava>
References: <20191128091633.29275-1-jolsa@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191128091633.29275-1-jolsa@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:30:15 -0500
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	David Miller <davem@redhat.com>, Yonghong Song <yhs@fb.com>,
	bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
	Martin KaFai Lau <kafai@fb.com>
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
X-MC-Unique: -JKGir4KPmqgYLLx82iArw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Nov 28, 2019 at 10:16:32AM +0100, Jiri Olsa wrote:
> From: Daniel Borkmann <daniel@iogearbox.net>
> 
> Allow for audit messages to be emitted upon BPF program load and
> unload for having a timeline of events. The load itself is in
> syscall context, so additional info about the process initiating
> the BPF prog creation can be logged and later directly correlated
> to the unload event.
> 
> The only info really needed from BPF side is the globally unique
> prog ID where then audit user space tooling can query / dump all
> info needed about the specific BPF program right upon load event
> and enrich the record, thus these changes needed here can be kept
> small and non-intrusive to the core.
> 
> Raw example output:
> 
>   # auditctl -D
>   # auditctl -a always,exit -F arch=x86_64 -S bpf
>   # ausearch --start recent -m 1334
>   ...
>   ----
>   time->Wed Nov 27 16:04:13 2019
>   type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
>   type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
>     success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
>     pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
>     egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
>     exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
>     subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
>   type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
>   ----
>   time->Wed Nov 27 16:04:13 2019
>   type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
>   ...
> 
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>

fyi I prepared userspace changes:
  https://github.com/olsajiri/audit-userspace/commit/3108a81fa8d937f07b4c78be8ae00fcd3d64f94d
  https://github.com/olsajiri/audit-testsuite/commit/16888ea7f14fa0269feef623d2a96f15f9ea71c9

I'll sumbit github PRs once the kernel change is pulled in

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

