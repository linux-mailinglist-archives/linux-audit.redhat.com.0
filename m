Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC3E1ACFEA
	for <lists+linux-audit@lfdr.de>; Thu, 16 Apr 2020 20:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587062850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b8HTergyIH7mqCVsgIL+D/FsjkezzGKTIC/aIaq3+kI=;
	b=PzHcDjRsfmYGqMqVF0vdhSeKb7V5bI1U5glEL0Ergj77zjEpunNhNVDYMEkDQ+BeSKF0Jg
	l26XHa6FQRA3c1SDUesM4y2LZ6pAZfddcExfPHNggEDzYpCgowR+TMm/eSfRIW4AFIIiVP
	nhNzIeHD934VoSQdWBKGvW2jCSIOVnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Tm9c9oDLOVqVv3AyIw0qhw-1; Thu, 16 Apr 2020 14:47:28 -0400
X-MC-Unique: Tm9c9oDLOVqVv3AyIw0qhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4F68017F3;
	Thu, 16 Apr 2020 18:47:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35DE760BE0;
	Thu, 16 Apr 2020 18:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33C3A93381;
	Thu, 16 Apr 2020 18:46:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GIkVXO023802 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 14:46:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA4952028CD3; Thu, 16 Apr 2020 18:46:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D52EC2026983
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 18:46:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70E48FF66C
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 18:46:29 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-cHoI9_p7MdSZ_vGsRPS19g-1; Thu, 16 Apr 2020 14:46:27 -0400
X-MC-Unique: cHoI9_p7MdSZ_vGsRPS19g-1
Received: by mail-io1-f43.google.com with SMTP id f19so22158293iog.5
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 11:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=in0h4YAzty+9JZO9SUMw6uZUIoZsfqFrxvDA7RKMDT8=;
	b=TkXenlPCzHZygLTvqc8RTbM1P2NcW0CJ3BnuXL0QcQPYGjZsdLiSIJZ2eBa/Nv6SSk
	QAcN8pJn8LG0fj+/VCGZAg6msCmA5Y18LK2dh960dKPifPdnX2QVchQiMrC+6h1tzxMl
	Z3H0EtHJDmSONLlMkPpb/LWKFUN0x1EMxaUUrU/S9yJBnLbIBlwlcC4OoG6FyweOILu6
	U27aVBF1oScDQ2aXUg0scXaOGhCRbDRnAfcUkCissHpzzmsuukcbGc6B5aPUrQ/Diafy
	iWwnwRWx+LdAZ6QMKop1xTH07c2AdXwaJESLnmI4edXHXlVN591lmMsIi480/Xjp4l2C
	mQMw==
X-Gm-Message-State: AGi0PuZ7zNHsVBapeqv9OThO44HKRB0xfSIkEhe4DJ4r/AhbcrUkskqO
	pfz+E1M+MabtcLpmyzxzJpY8goZ7cGU=
X-Google-Smtp-Source: APiQypJVsZ9HCjjPEtsFehs33HQIX8jvT/J6qSq0OmR6ZHzdO+W5S1fbz4slAGLw3zXwMuybePcGAA==
X-Received: by 2002:a6b:3783:: with SMTP id
	e125mr32404830ioa.188.1587062786346; 
	Thu, 16 Apr 2020 11:46:26 -0700 (PDT)
Received: from [192.168.0.137] ([216.158.248.173])
	by smtp.gmail.com with ESMTPSA id
	w69sm7379850ili.76.2020.04.16.11.46.25 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 16 Apr 2020 11:46:25 -0700 (PDT)
Subject: Re: multicast listeners and audit events to kmsg
To: linux-audit@redhat.com
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <0512fcf8-de73-2334-5179-7a37605c04fb@magitekltd.com>
Date: Thu, 16 Apr 2020 12:46:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200416120612.GA52165@gardel-login>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/16/20 6:06 AM, Lennart Poettering wrote:

>
>> I'm regretting having developped this feature due to the problems it has
>> caused the audit developpers and innocent bystanders.  Instead, an audit
>> daemon plugin should have been used to direct log records to
>> journald.
> I am sorry, but this doesn't work for us. We do not want to do IPC to
> some audit daemon (journald runs during early boot and in the initrd,
> it has a very special relationship with early boot stuff and PID1, and
> thus being a client to other daemons is highly problematic, if those
> other daemons are managed by systemd as well, and run only during later
> boot). In fact we don't even want the dependency on the audit
> userspace package at all.
>
> In systemd we just think that audit information is pretty interesting
> even if you don't want to buy into the whole government regulation
> stuff, even if you don't want the auditd to run, and the full audit
> package installed. i.e. we want to collect the data as one of our
> various data streams, as a secondary consumer of it, and leave it to
> the audit package itself to do everything else and be the primary
> consumer of it.
>
> Using the multicast group is our way of saying: "we don't want to own
> the audit stream, you can keep it; we just want to have a look
> too".
>
> I believe that there are plenty of systems where audit logs should be
> collected but the whole auditd daemon should not be around, i.e. where
> the usefulness of the data is acknowledged without acknowledging that
> government regulations matter or the audit package should exist on
> every single system.

I do not understand "I believe that there are plenty of systems where 
audit logs should be collected but the whole auditd daemon should not be 
around..."... and without supportive data, tend to think that is untrue. 
Unless of source, the real desire is to provide a "better" audit logging 
system.

The "whole audit daemon" sounds like it is huge, which it isn't ... and 
regardless, if logs are collected, doesn't this imply _something_ is 
managing the logs? We currently call that "auditd".

>> Well, Steve, Paul and myself are all fairly firmly on the side of the
>> problem being in systemd and its overreach.
> We explicitly don#t want to own the audit stream, that's why we don#t
> use the unicast stuff, but only subscribe via the mcast stuff, so that
> we don't interfere with auditd's own processing if it is running, and
> we don't exlcude auditd from running. we want a mode where audit is
> collected, just like that without any auditd package installed, but if
> you decide to install auditd things just work too.
>
>>> For Richard and the "explicit configuration" approach in particular, I'm
>>> missing some further details:
>>>   * Is the current behavior considered buggy, or is that intended to be
>>>     kept as the default?
>> The current systemd behaviour of unilatterally enabling audit logging is
>> considered buggy.  The current audit kernel behaviour is considered
>> intentional.
> Well, we try hard to not step on your toes and do not use the unicast
> stuff and do not pretend to be auditd, so that auditd can be installed
> and run in parallel to journald with us being in the backseat. It's my
> understanding that the mcast stuff was added for this kind of thing,
> except that it never became useful, since it also means that kmsg is
> spammed by audit.
>
> THere's a usecase for collecting audit but not running the whole audit
> userspace suite, can't you see that?

I must admit that I cannot see a use case outside the realm of "because 
I want to".

> i.e. i for one am interested in
> selinux audit msgs, but I am not interested in the audit toolchain I
> must say, I really am not, and I am pretty sure there are many others
> like me. But you basically tell us to go away, or buy into the whole
> audit userspace.

Seems like a lot of work to avoid using auditd and the existing 
audispd-syslog plugin. It's known to work reasonably well. You could, if 
desired, turn off the writing of events to disk and still get everything 
interpreted/ordered through the audisp-syslog plugin - or write a simple 
similar one? But I assume you know that already.

I am quite sure there are many others like me that cannot envision the 
relevance of having kernel auditing without audit userspace tools 
involved, at least not in any environment where assurance exists.

The "whole audit userspace" being intimately connected to the kernel 
production of events, ensures (as best possible IMHO) that the while 
kernel supplies accuracy/validity, the userspace receiver then ensures 
event assimilation, log handling, dissemination. IIUC, you really DO 
want to pretend to be auditd, rather than get the auditd-disseminated 
results. That's fine, but may as well be honest.

I have to think about it, but in fact there may be a good reason why I 
would not want the multicast option available. I'd feel inclined, based 
on my own prejudice of delivering secure (as possible) systems, to 
instead find a way to limit only the auditd from the supplied audit rpm 
as being the sole unicast recipient. I do see your point about a kmsg 
forwarding disable option for people for whom this behavior isn't desired.

Just for reference, "government regulations matter" is a true statement 
and there are communities who depend on a reliable, secure audit system 
for adherence. Some of these communities are actually seen as vital. I 
understand that you are a distinguished linux contributor, and I am not, 
but from my perspective as a person who uses, delivers and maintains 
systems where the current audit userspace toolset is used in the manner 
for which it is intended, I'm really having a hard time understanding 
why you would not simply take the existing output facility and use it 
however you choose. The startup timing argument doesn't fly with me, sorry.

Anyway, that's my perspective.



V/R,

LCB

-- 
LC Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

