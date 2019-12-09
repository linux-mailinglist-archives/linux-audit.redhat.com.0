Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C2DE111704C
	for <lists+linux-audit@lfdr.de>; Mon,  9 Dec 2019 16:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fG9BwJMrL3k5dGWFl/pO3jbYANFWJcxXGkMtjVOK80c=;
	b=jTFQbufnTB5Bm0zDzjkc70kk2zD800U9Gl89uzBiLVZMgk/BL3XNpdMGtRUY280Q3tX7hZ
	8Qop61jpQHDQ2j+AoNDrzQarNhD6fwwbY5da/1VtqFqExwVcTCaQOEdYMvgzL2KdZdUTeL
	1JssUtTwSIYf7bfvSV6jgHiTuxFCckE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-3xen45UyP2KZIDy74JEdJA-1; Mon, 09 Dec 2019 10:23:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A58DC4E;
	Mon,  9 Dec 2019 15:23:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 941B71001902;
	Mon,  9 Dec 2019 15:23:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5ACC1803C38;
	Mon,  9 Dec 2019 15:23:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9CFkvp021762 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 07:15:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA0DB2166B2B; Mon,  9 Dec 2019 12:15:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B559D2166B29
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 12:15:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 627DB18E976B
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 12:15:44 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-361-SW2bByJKNmiGkerL1QxI-A-1; Mon, 09 Dec 2019 07:15:40 -0500
Received: from [2001:1620:665:0:5795:5b0a:e5d5:5944] (helo=localhost)
	by www62.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89_1)
	(envelope-from <daniel@iogearbox.net>)
	id 1ieHww-0005Ut-0M; Mon, 09 Dec 2019 13:15:38 +0100
Date: Mon, 9 Dec 2019 13:15:37 +0100
From: Daniel Borkmann <daniel@iogearbox.net>
To: Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191209121537.GA14170@linux.fritz.box>
References: <20191206214934.11319-1-jolsa@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191206214934.11319-1-jolsa@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25658/Mon Dec  9 10:47:26 2019)
X-MC-Unique: SW2bByJKNmiGkerL1QxI-A-1
X-MC-Unique: 3xen45UyP2KZIDy74JEdJA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9CFkvp021762
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:22:37 -0500
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
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

Paul, Steve, given the merge window is closed by now, does this version look
okay to you for proceeding to merge into bpf-next?

Thanks,
Daniel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

