Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFC97EC6
	for <lists+linux-audit@lfdr.de>; Wed, 21 Aug 2019 17:37:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B16218C891F;
	Wed, 21 Aug 2019 15:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1322850A99;
	Wed, 21 Aug 2019 15:37:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A11524F30;
	Wed, 21 Aug 2019 15:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7LFb6QW015304 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 11:37:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C2C650DD6; Wed, 21 Aug 2019 15:37:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97ACE5B807
	for <linux-audit@redhat.com>; Wed, 21 Aug 2019 15:37:04 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B827308424C
	for <linux-audit@redhat.com>; Wed, 21 Aug 2019 15:37:03 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id s19so2130668lfb.9
	for <linux-audit@redhat.com>; Wed, 21 Aug 2019 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2619U9Tm5TYEgcBQkA05KbEPScI41FeuQa1aH7Sw3kQ=;
	b=M/JE1rZZm/RfbqUxzJX37QJ/vamqziXn2XHNDm0iZw1yd9BEhyNhUIiTk3/KAhR54O
	Y9PwNHb97zozoLcuUnc46BF0qDf6vA9b/F4w36fsU4uTtjjANfXa/vz/qSZ6leZcV1Mq
	UvlMpumI9H33UjgxfvjEMHRYeTpcfDa+S9yLLhIY0T5Hkz4MK+2zpOxo0PLE5/FOI4tV
	62pqd8EQo5WVNke4HmUwGQBrnWc+pi2V9UB082jC2pEynBpKZqbjRk9zV05e/pXaOWCA
	rdvRY9J97Qr3Le4nJQfBpDoKXxG9vH6d6pCChNzkfbez6FOgfuABS4iKn3Wu8pEaG1Au
	MDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2619U9Tm5TYEgcBQkA05KbEPScI41FeuQa1aH7Sw3kQ=;
	b=s20SprfVfRikJsMv+9ocj8a5GDkf+XnB98w5o+TxERGZIUtJCZwW3nTtkqgIGfx6nO
	woDJIfG/lJlqkLZ1892LVkbB5gh8+Vfqvsbh969JHxp+DxQ4NuNy0UbaueNpXbzWnCVe
	MhBhhdGDiPGAbbZwkfBEgDx0BNaeAZEqLMznGQ3m9rKZgd19h4l2S0gr7CCUKqBHo386
	OZe9ov9YmWfBCY3lhhAPZtBaKXeo9QnCVfvPpzhte+TR84hHflZzexj9oRNJCUnIIDvL
	pRFiddKzn3A12eqScRT+0Z17TtrrkaVcEXaod8weByposgWw0GR1dLx1i6BfMSftctHX
	epQg==
X-Gm-Message-State: APjAAAUcn97FL7oZZswvVCUeZAh37aa8SL8zz9kXCh8gCItURqTeKvb4
	fywUk0O3U1XvF7d/zuaH1C41BqHfma6qQkdRzdqD
X-Google-Smtp-Source: APXvYqwqThu91Iy3zjtydclgxUMDIcs4QNLzXbu5HbIKVhlNSP6g2YCGmjVSAy6XIf80VuoG1dcRm55IgYUdgInPglU=
X-Received: by 2002:ac2:4c37:: with SMTP id u23mr437303lfq.119.1566401821240; 
	Wed, 21 Aug 2019 08:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <4997df37-4a80-5cf5-effc-0a6f040c4528@huawei.com>
In-Reply-To: <4997df37-4a80-5cf5-effc-0a6f040c4528@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Aug 2019 11:36:50 -0400
Message-ID: <CAHC9VhS_DCBRX6kkmiSYBzq+ELN2AYRypRN6vR_J1+JOi2FDvw@mail.gmail.com>
Subject: Re: [Question] audit_names use after delete in audit_filter_inodes
To: Chen Wandun <chenwandun@huawei.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 21 Aug 2019 15:37:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 21 Aug 2019 15:37:03 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Wed, 21 Aug 2019 15:37:18 +0000 (UTC)

On Wed, Aug 21, 2019 at 5:31 AM Chen Wandun <chenwandun@huawei.com> wrote:
>
> Hi,
> Recently, I hit a use after delete in audit_filter_inodes,

...

> the call stack is below:
> [321315.077117] CPU: 6 PID: 8944 Comm: DefSch0100 Tainted: G           OE  ----V-------   3.10.0-327.62.59.83.w75.x86_64 #1
> [321315.077117] Hardware name: OpenStack Foundation OpenStack Nova, BIOS rel-1.8.1-0-g4adadbd-20170107_142945-9_64_246_229 04/01/2014

It looks like this is a vendor kernel and not an upstream kernel, yes?
 Assuming that is the case I would suggest you contact your distro for
help/debugging/support; we simply don't know enough about your kernel
(what patches are included, how was it built/configured/etc.) to
comment with any certainty.

Linux Kernels based on v3.10.0 are extremely old from an upstream
perspective, with a number of fixes and changes to the audit subsystem
since v3.10.0 was released.  If you see the same problem on a modern
upstream kernel please let us know, we'll be happy to help.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
