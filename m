Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DAD0B1D9BA8
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 17:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589903366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wYhtn5MEYaoknY/DANms8rRLHCv0j55RZWoTycTsHIk=;
	b=ZX2ibsZOvsjAcbXHi6z8uMPEu0BXDsvVjCnWi4R3cy9ozDR/GCJ7colod0knp85wehgdWO
	c2Uyq6girczZCbX1lZrSivi9KrqhR6jtThuo34VzfU/pUBkNGMFIfgcjnQngCQqJ3XLHOT
	D4z4Jf1jjk3erg3qnbANGGyfgf/150s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-iA-TNXRnMEGoHzXDWl13bQ-1; Tue, 19 May 2020 11:49:24 -0400
X-MC-Unique: iA-TNXRnMEGoHzXDWl13bQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D9B8015D2;
	Tue, 19 May 2020 15:49:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29C25799C;
	Tue, 19 May 2020 15:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FA111809543;
	Tue, 19 May 2020 15:49:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JFn6Mx005604 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 11:49:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 647602156A4C; Tue, 19 May 2020 15:49:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECEB2156A49
	for <linux-audit@redhat.com>; Tue, 19 May 2020 15:49:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFFCF18F024A
	for <linux-audit@redhat.com>; Tue, 19 May 2020 15:49:03 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-io1GdoYqPFSSEp6T86ypPQ-1; Tue, 19 May 2020 11:49:00 -0400
X-MC-Unique: io1GdoYqPFSSEp6T86ypPQ-1
Received: by mail-ej1-f65.google.com with SMTP id s3so12379844eji.6
	for <linux-audit@redhat.com>; Tue, 19 May 2020 08:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kXqsFaZYUrWPd8g8P+NBtNmPnuSPuWvOF7lOsApZicc=;
	b=dMSYQamOFkgWXe9F0M72WQYeRttoqA8hJW+t8H5WLV4+WnrA3xhPzhdMLF6HFTK9S3
	1I/jJ0nj1d2hjOvY1iWG2BqS1XpUYk8WBI2nAXx2SPIFajjI3NssXF9E04cK6+dod+NX
	qhK1a/SMtlRF9CLcWy1rMj9LilT+4qpmHiOYi9q9PAwUeB6oytQoKNlbE3gO0Wm6mOlW
	rhwbFypFpPF/P0174NQwDev/EjTDPqWBlL5+vFhPpTr2IiM545Jlni0+g8YgK833Pzno
	8WEUSmOjjxw8kyQFLTwTqwXC6l0ZzlSz51WbB/o+7ycww/lehX/EP5Bv4c9ndjiXf4cy
	ZfzA==
X-Gm-Message-State: AOAM530ZIyjbEvvBqv6SsfRTbhkQm2a7TDVaigqW+gMdWAadlsJj4qu5
	EnYQms5nFHxegZtTCHWxyj9k+zDxmV2mhxvJ6qi3
X-Google-Smtp-Source: ABdhPJwNdUnc0T4bpKK1FqwyPy1M/CPbyb/M8IJ2ellHqIqSh1o8ijGRW/1DbacfIW8CcfyCmJ66V3nNr01mTEEzS9s=
X-Received: by 2002:a17:907:b13:: with SMTP id
	h19mr1164608ejl.488.1589903339426; 
	Tue, 19 May 2020 08:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200514221142.11857-1-casey@schaufler-ca.com>
	<20200514221142.11857-21-casey@schaufler-ca.com>
	<CAEjxPJ67cA_A-Oh72EGgmCrP6k9x0PuaU2q7UL9eOc+J6Do0zQ@mail.gmail.com>
	<9cabbb54-69e6-91e6-88f8-e76d53da2a77@schaufler-ca.com>
	<CAHC9VhRGopG0=DbEZArz2X2yfEQ1pOqoSLRMn9ABe5JYZB2Y8Q@mail.gmail.com>
	<774a37e3-3469-d606-a468-a57892b44645@schaufler-ca.com>
In-Reply-To: <774a37e3-3469-d606-a468-a57892b44645@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2020 11:48:47 -0400
Message-ID: <CAHC9VhQOVRYTvjp4kmJx-rziSqeRb-=XSKYMBeN_o-ioJp7JNg@mail.gmail.com>
Subject: Re: [PATCH v17 20/23] Audit: Add a new record for multiple subject
	LSM attributes
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: John Johansen <john.johansen@canonical.com>,
	SElinux list <selinux@vger.kernel.org>,
	Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, casey.schaufler@intel.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 18, 2020 at 8:16 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/18/2020 3:21 PM, Paul Moore wrote:
> > On Mon, May 18, 2020 at 4:43 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 5/18/2020 11:02 AM, Stephen Smalley wrote:
> >>> On Thu, May 14, 2020 at 7:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>> Create a new audit record type to contain the subject information
> >>>> when there are multiple security modules that require such data.
> >>>> This record is emitted before the other records for the event, but
> >>>> is linked with the same timestamp and serial number.
> >>>>
> >>>> Reviewed-by: Kees Cook <keescook@chromium.org>
> >>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >>>> Cc: linux-audit@redhat.com
> >>>> ---
> >>> With this patch, I see userspace audit records like this one:
> >>>
> >>> type=SYSTEM_BOOT msg=audit(1589816792.181:103): pid=789 uid=0
> >>> auid=4294967295 ses=4294967295 subj=? subj=system_u:system_r:init_t:s0
> >>> msg=' comm="systemd-update-utmp"
> >>> exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=?
> >>> terminal=? res=success'
> >>>
> >>> I'm guessing that userspace is appending the second subj= field when
> >>> it sees subj=? or otherwise is missing subj= information?
> >> I haven't looked at the userspace code, but I expect you're right.
> >> It looks like there will need to be some change in the userspace
> >> for the multiple LSM case. The "completion" shown here isn't correct,
> >> because it only fills in one of the subject attributes, not both.
> > Wait, didn't we agree on a a "subj=? subj_selinux=XXX
> > subj_apparmor=YYY subj_smack=ZZZ" format?  It looks like there are two
> > 'subj' fields in the record above which is bad, don't do that please.
>
> That's not something that's coming from the kernel.

Yes it is.  Well, sorta.  With audit *everything* must come from the
kernel in order to meet the security goals that audit tries to
achieve.  I know you already know most of this, but I'm mentioning it
for others who are following along.

The record above is an audit user message which is a message that is
generated in userspace by a trusted process and written to the kernel,
the kernel then generates an audit record based on this message and
inserts it into the audit stream.  The text string that originates
from the userspace process is placed in the "msg" field; the
UID/AUID/subj/etc. information is supplied by the kernel (we don't
want to trust the process any more than absolutely necessary).

On my system, running a random but fairly modern kernel (a 5.7.0-rc5
variant) I see the following for the SYSTEM_BOOT record on my most
recent boot:

  type=SYSTEM_BOOT msg=audit(05/13/2020 14:19:23.983:89) : pid=633
    uid=root auid=unset ses=unset subj=system_u:system_r:init_t:s0
    msg=' comm=systemd-update-utmp
      exe=/usr/lib/systemd/systemd-update-utmp hostname=? addr=?
      terminal=? res=success'

... pay special attention to the single "subj" field ;)

> I'll check again, but I think that everyplace in the kernel that
> produces a subj= has been trained to create a type=1420 record
> instead.
>
> >>> Then we have kernel audit records like this:
> >>>
> >>> type=PROCTITLE msg=audit(1589816791.959:101): proctitle=2F7362696E2F617564697463
> >>> 746C002D52002F6574632F61756469742F61756469742E72756C6573
> >>> type=SYSCALL msg=audit(1589816791.959:101): arch=c000003e syscall=44
> >>> success=yes exit=1056 a0=3 a1=7fff9ccc98a0 a2=420 a3=0 items=0
> >>> ppid=773 pid=783 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
> >>> egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="auditctl"
> >>> exe="/usr/sbin/auditctl" subj=? key=(null)
> >>> type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> >>> subj_selinux=system_u:system_r:unconfined_service_t:s0
> >>> subj_apparmor==unconfined
> >>> type=CONFIG_CHANGE msg=audit(1589816791.959:101): auid=4294967295
> >>> ses=4294967295 subj=? op=add_rule key=(null) list=1 res=1
> >>> type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> >>> subj_selinux=system_u:system_r:unconfined_service_t:s0
> >>> subj_apparmor==unconfined
> >>>
> >>> where we are getting multiple copies of the new record type, one for
> >>> each record type that had subj=?.
> >> While obviously wasteful, the type=1420 behavior is consistent with
> >> the subj=? behavior, which is to duplicate the subj= value. I know
> >> we've got enough hobgoblins in the audit system that we don't need
> >> to add any more in the name of a foolish consistency.
> > You need to provide a bit more reason why we need byte-for-byte
> > duplicate records in a single event.  As it currently stands this
> > looks like something we definitely don't want.
>
> The CONFIG_CHANGE record already duplicates the subj= information
> in the SYSCALL record.

Yeah, let's not get started on that discussion ;)  Thankfully that
isn't what I was talking about in my earlier comment in this thread.

In the audit event above we see a number of records all part of a
single event (they all share the same timestamp:
"audit(1589816791.959:101)"), and in this single event we see two
identical records of type 1420 (the new record you are proposing).
That is my concern, I would expect just a single type 1420 record to
be added to this event.

For those who may not be familiar with audit, this is what a typical
audit event with a CONFIG_CHANGE record that adds an audit filter rule
looks like with an unpatched kernel:

  type=PROCTITLE msg=audit(05/13/2020 13:55:25.598:10349) :
    proctitle=auditctl -a always,exit -F arch b64 -S bpf
      -k testsuite-1589392525-yPWwmHYp
  type=SYSCALL msg=audit(05/13/2020 13:55:25.598:10349) : arch=x86_64
    syscall=send to success=yes exit=1088 a0=0x4 a1=0x7ffc93b8c910
    a2=0x440 a3=0x0 items=0 ppid=2650 pid=2659 auid=root uid=root
    gid=root euid=root suid=root fsuid=root egid=root sgid=root
    fsgid=root tty=pts0 ses=1 comm=auditctl exe=/usr/sbin/auditctl
    subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
  type=CONFIG_CHANGE msg=audit(05/13/2020 13:55:25.598:10349) : auid=root
    ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
    op=add_rule key=testsuite-1589392525-yPWwmHYp list=exit res=yes

> I just maintained the duplication. You're
> right, it's silly to have two identical type=1420 records for the event.
> I will have to come up with a mechanism to prevent the duplication.
> with luck, there's already a similar case for some other record.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

