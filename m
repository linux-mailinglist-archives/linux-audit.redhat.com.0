Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCA22D3059
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 17:58:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Lln7UeMtNqiEsZrtQKWOQQ-1; Tue, 08 Dec 2020 11:57:59 -0500
X-MC-Unique: Lln7UeMtNqiEsZrtQKWOQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6220785C708;
	Tue,  8 Dec 2020 16:57:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DABD5D9DD;
	Tue,  8 Dec 2020 16:57:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ABE44BB40;
	Tue,  8 Dec 2020 16:57:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8GvJCx013433 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 11:57:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0F3B100414C; Tue,  8 Dec 2020 16:57:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC742112D411
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 16:57:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFA291871CC9
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 16:57:12 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-kNsbFoJfOUSw6RMz2yCstw-1; Tue, 08 Dec 2020 11:57:10 -0500
X-MC-Unique: kNsbFoJfOUSw6RMz2yCstw-1
Received: by mail-pl1-f194.google.com with SMTP id r4so3140730pls.11
	for <linux-audit@redhat.com>; Tue, 08 Dec 2020 08:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eg5WsBS4rWsxggV1doS/ZGqWZ+DDJNln2wv7rY0vwyA=;
	b=DkuYj9fYDsQXPlfeC81IHep7Q0/RI7ZmDdTe7CIf39VvrlWKPpY7EYkLmg+5LtvUR6
	fxqZYxo8gPvkypobdp0IXfY0GsIZ0WNAB9UaLEbl1M5MBwa0f/VhCivk4mAfxHOKyppB
	6lEnk29oQNe2IFVfjssjEeJuriV8IaSTR5ZOoFxkMiGQf4uiyEJHJ2xc0WN4KWkosrlN
	Kk9OJ3AwZYNaXKl9E9e9vq+mun/NaV68FG1iQTEltPySfm3/mcP/SeAhEgP+f38YuU4H
	AKCGk0Ndbnk3Y7D/gUOhPKJDJz9+vc86RWJhTtov2dIX97EQ4N67Je4Nx8SjUd4rk/xa
	900g==
X-Gm-Message-State: AOAM5335i7pn9Xd0zyclkBKAHij/GMek/vgCNH9m79AUyqnBHr1CGQf9
	VvvawzcGd1Ot9wZOA4OlLQxd5ApFg/CtJ91I
X-Google-Smtp-Source: ABdhPJxjZHnPblT/d7xZTC1IiHkSNhs6jdAksyjfE3/Inj8cmYAhLMEIj1rRA5BVRrKT4kXuc0DVYw==
X-Received: by 2002:a17:902:c40c:b029:da:74c9:df4f with SMTP id
	k12-20020a170902c40cb02900da74c9df4fmr21967443plk.68.1607446628986;
	Tue, 08 Dec 2020 08:57:08 -0800 (PST)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:edd8?
	([2607:f768:200:b:ffff:ffff:ffff:edd8])
	by smtp.gmail.com with ESMTPSA id
	z15sm6486458pfn.34.2020.12.08.08.57.07 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 08 Dec 2020 08:57:08 -0800 (PST)
Subject: report audit wait metric in audit status reply
To: linux-audit@redhat.com
References: <20200701213244.GA1817@linux-kernel-dev>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <216556dd-9b0e-2844-0a4a-1b36b474c286@magitekltd.com>
Date: Tue, 8 Dec 2020 09:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701213244.GA1817@linux-kernel-dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 7/1/20 3:32 PM, Max Englander wrote:

> In environments where the preservation of audit events and predictable
> usage of system memory are prioritized, admins may use a combination of
> --backlog_wait_time and -b options at the risk of degraded performance
> resulting from backlog waiting. In some cases, this risk may be
> preferred to lost events or unbounded memory usage. Ideally, this risk
> can be mitigated by making adjustments when backlog waiting is detected.
>
> However, detection can be diffult using the currently available metrics.
> For example, an admin attempting to debug degraded performance may
> falsely believe a full backlog indicates backlog waiting. It may turn
> out the backlog frequently fills up but drains quickly.
>
> To make it easier to reliably track degraded performance to backlog
> waiting, this patch makes the following changes:
>
> Add a new field backlog_wait_sum to the audit status reply. Initialize
> this field to zero. Add to this field the total time spent by the
> current task on scheduled timeouts while the backlog limit is exceeded.
>
> Tested on Ubuntu 18.04 using complementary changes to the audit
> userspace:https://github.com/linux-audit/audit-userspace/pull/134.

Max,

Along those lines, the current failure actions (silent, printk, panic) 
are kind of restrictive. I guess one can filter on the printk messages 
and redirect those to a userspace handler which might do something 
specific to the operating environment? Is that how you would handle it? 
Or would your admin just look for it and report? If you have any 
shareable info I'd appreciate seeing it. Almost no one I can think of 
would want a panic to happen, but only almost. No one who needs some 
level of assurance would want "silent".

FWIW I looked at the kernel printk calls, and although I maybe looked at 
the wrong one, even though on boot I'm seeing drops from the "auditctl 
-s", I do not see any output in the dmesg buffer that appears to be 
indicative of this. My guess there is that on bootup, the auditd 
userspace config has not yet been activated and it's likely using a 
"silent" default...but here I realize was not the focus of your effort. 
Just musing.

I applaud your efforts in this area, and if you are able to share any 
practices about handling the backlogs I'd appreciate seeing that.

V/R,

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

