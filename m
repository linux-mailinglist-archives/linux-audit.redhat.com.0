Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84977117B6D
	for <lists+linux-audit@lfdr.de>; Tue, 10 Dec 2019 00:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575934086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VwiMo+EWtC6AJS4bCyKlocrZXrYYlxgn4qTwCYcZ2lI=;
	b=ZGg+ssCEgyKhzVwsLPZKnpSjwYYWRzFSsIxgsKl6tJCDORnYNNlPv6qTJDuuMCKoLBtdc7
	0KNpGGvkZYMwDAWQYDUVHiVXqPV5XmWqXQYDuwE+XPkc+58L/D+lUtT0cEWuLJBsLCteqc
	Y1106C7UexgcFNVE6CVOIhRlpufytOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-5Oqp4H6UMuqsaPeOLZyCyg-1; Mon, 09 Dec 2019 18:28:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E7D8DBA5;
	Mon,  9 Dec 2019 23:27:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4824460BE1;
	Mon,  9 Dec 2019 23:27:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C26083552;
	Mon,  9 Dec 2019 23:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9NK2Ck009289 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 18:20:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 788251006EB8; Mon,  9 Dec 2019 23:20:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F1CA10A2511
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:20:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C84018E9774
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:20:00 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-111-ylP9ZCyeMK2OSaFatEeC1Q-1; Mon, 09 Dec 2019 18:19:58 -0500
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89_1)
	(envelope-from <daniel@iogearbox.net>)
	id 1ieSJl-0007I5-PL; Tue, 10 Dec 2019 00:19:53 +0100
Received: from [178.197.249.52] (helo=pc-9.home)
	by sslproxy02.your-server.de with esmtpsa
	(TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1ieSJl-000NZ5-8y; Tue, 10 Dec 2019 00:19:53 +0100
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
To: Paul Moore <paul@paul-moore.com>
References: <20191206214934.11319-1-jolsa@kernel.org>
	<20191209121537.GA14170@linux.fritz.box>
	<CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <d387184e-9c5f-d5b2-0acb-57b794235cbd@iogearbox.net>
Date: Tue, 10 Dec 2019 00:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25658/Mon Dec  9 10:47:26 2019)
X-MC-Unique: ylP9ZCyeMK2OSaFatEeC1Q-1
X-MC-Unique: 5Oqp4H6UMuqsaPeOLZyCyg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9NK2Ck009289
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 18:27:48 -0500
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/9/19 3:56 PM, Paul Moore wrote:
> On Mon, Dec 9, 2019 at 7:15 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
>> On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
>>> From: Daniel Borkmann <daniel@iogearbox.net>
>>>
>>> Allow for audit messages to be emitted upon BPF program load and
>>> unload for having a timeline of events. The load itself is in
>>> syscall context, so additional info about the process initiating
>>> the BPF prog creation can be logged and later directly correlated
>>> to the unload event.
>>>
>>> The only info really needed from BPF side is the globally unique
>>> prog ID where then audit user space tooling can query / dump all
>>> info needed about the specific BPF program right upon load event
>>> and enrich the record, thus these changes needed here can be kept
>>> small and non-intrusive to the core.
>>>
>>> Raw example output:
>>>
>>>    # auditctl -D
>>>    # auditctl -a always,exit -F arch=x86_64 -S bpf
>>>    # ausearch --start recent -m 1334
>>>    ...
>>>    ----
>>>    time->Wed Nov 27 16:04:13 2019
>>>    type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
>>>    type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
>>>      success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
>>>      pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
>>>      egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
>>>      exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
>>>      subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
>>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
>>>    ----
>>>    time->Wed Nov 27 16:04:13 2019
>>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
>>>    ...
>>>
>>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
>>> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
>>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
>>
>> Paul, Steve, given the merge window is closed by now, does this version look
>> okay to you for proceeding to merge into bpf-next?
> 
> Given the change to audit UAPI I was hoping to merge this via the
> audit/next tree, is that okay with you?

Hm, my main concern is that given all the main changes are in BPF core and
usually the BPF subsystem has plenty of changes per release coming in that we'd
end up generating unnecessary merge conflicts. Given the include/uapi/linux/audit.h
UAPI diff is a one-line change, my preference would be to merge via bpf-next with
your ACK or SOB added. Does that work for you as well as?

Thanks,
Daniel


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

