Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0781D8977
	for <lists+linux-audit@lfdr.de>; Mon, 18 May 2020 22:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589834623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=rxFRvvrP2vrdtP6JVOQyobfp+azYKV311ZQvUq+P3vQ=;
	b=Ju62UecO426Gi5GnVJXVL9ll9nSc2OflU7LTrhTedvPyEp5U88FsUdMAeZE7t3yMgJlDZ3
	/rqVPrextsWkf8fEiFlI3INTRbjnot+q0jMakP61uCdS+u89MgfRptSBq9uVg5x6L/Rv0L
	LAs3w9tpHYCbc+S9NCdXM9op3r3kz94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-yofLHN9yN3iZ0dNTGT35dg-1; Mon, 18 May 2020 16:43:41 -0400
X-MC-Unique: yofLHN9yN3iZ0dNTGT35dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A9B1005510;
	Mon, 18 May 2020 20:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 117B35799C;
	Mon, 18 May 2020 20:43:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4996E4ED59;
	Mon, 18 May 2020 20:43:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IKhBtT020775 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 16:43:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A1BC200AFEA; Mon, 18 May 2020 20:43:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09DA62028CD2
	for <linux-audit@redhat.com>; Mon, 18 May 2020 20:43:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C2C8803AC0
	for <linux-audit@redhat.com>; Mon, 18 May 2020 20:43:08 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-358-_j78OtBLMdmyxoaCr9h0bQ-1;
	Mon, 18 May 2020 16:43:06 -0400
X-MC-Unique: _j78OtBLMdmyxoaCr9h0bQ-1
X-YMail-OSG: QQ2Pmo8VM1nzKZV9eSey2PDRZnytyVUgJQ2i9k9DIzz1Dw18W7cY4uOaGLKZXd5
	BeUNrPjKKYXeTvsFBPY5c1jdheJ7qlGd7K7M9N8b1lxVLHiR0SfJfhbE51j838rUynK_tS3FZQeg
	i1EpvUdNsrcacmsUl_kKekQF4NrGU_Ul2w_rGjaM7D8sbf6yW7CR7GCk45SZpRR4Lj7slvN6vPpG
	R.ydB1i_6YLAG.CI7MZiL1wcub9eIvC3otX6nOlFV5X6RD7mfhuRjgXVzYDlqVN8KU4Ok5BqG05I
	0hJQolU9rJHtuUcbHR0mS5xgCppWUv_9KGnUFEc8fqiynY8XknioXRAjh2a3SXA7qSfQ7MZdvo2.
	noiaItbqU2eX7uhmk0gfVVHYBVgp7WBC1RiKa9TtAnRPuSgKpcPundNk_1_l6bT8nyZCeoQFpH11
	trkRRbpyacF4lDMC__GSuMkadkTshskcSghUm8ja.t30bK_utaEW_YP7TgFJZ.Kkgsv0y38Tevfi
	ZcCxgGBHXx3eX7at7walf4KYyRDtLztNJYbn0GoOfEwfUckjyXDu1Ucmm1Tw_.qqjiOh7pcoPjjn
	2Zw5jOD1BdZqJf8a8Civ5iCP49XAzssMzFi49VVX97v.DbAPsR4QwMnxxUH6g.n8Vsf392jQZnMN
	rsp.qNwHJgLNoAApXk0c0YIfuSkt.mNCOgHdy5kXE6HJ_gTm9g2YWd.hydP313wzp68O2gFk_KOO
	ALMKPcFOLYA9Z3OdL5e8HzLlrQrxzYBlOleMneytyIcKvHZaSdqljg0cudUxO8duGjTmL8AjuixV
	d.Cm6ZDD0bIZAZN2WMmvDMpDnG.o_wGAdJCD9KKfPUeDZRflqdZnSB0HjREFnB700h5klvyfMGoM
	LD3xysyYlJp7PCWKiRFOBFaHCVOk5sfjbGDkn0LSrCej8J8Tn5XoAjmAmCYXBb_GifE6jkBnpP0l
	hEWLbDh80EOhJSDxJoYoLlSJaXEGcwNDv8WZWAGgfe.6VgUb.4zzLnRGU89epG4gosdCASePzd5Z
	hZZIGIKqxHgioKOshypXDExsN4usO5EHUO_ZprzKIj31Y7FoBv4f5NZBYmhevVh9aXb_W6sQ69_g
	w11_PFHUJZUCUOrqMXztfAQB4FAYQ_jivzXdDFckYd7rsBO82hcd9S_3Ux5AHfL34R7JJPbJrtY8
	JmWFAKjOz483zg59L6Mw2dG04EjkrhL4yAneccZAvnF3Gl.RLxuuhmgHPVfvXgwnNUVTyF3wMx3C
	GIYTvXWwdsIreLZILQj5RyPAvdvadmjHFHdUr8CWxslZwLuIX2KclrSDquMFzzZ_bL8HT2mjRkGJ
	efOuzkd7bD7724rnTIewiUi7a6DajKvD1rCjRR1lokwygC88upiL6joUiqtvWPvBirQMfKn._JfE
	7Q_Gd50W2KDDyMcQGmA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 18 May 2020 20:43:05 +0000
Received: by smtp405.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 4cb43f4b09468ed915d9936384691d5b; 
	Mon, 18 May 2020 20:42:59 +0000 (UTC)
Subject: Re: [PATCH v17 20/23] Audit: Add a new record for multiple subject
	LSM attributes
To: Stephen Smalley <stephen.smalley.work@gmail.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
	<20200514221142.11857-21-casey@schaufler-ca.com>
	<CAEjxPJ67cA_A-Oh72EGgmCrP6k9x0PuaU2q7UL9eOc+J6Do0zQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <9cabbb54-69e6-91e6-88f8-e76d53da2a77@schaufler-ca.com>
Date: Mon, 18 May 2020 13:42:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ67cA_A-Oh72EGgmCrP6k9x0PuaU2q7UL9eOc+J6Do0zQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04IKhBtT020775
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

On 5/18/2020 11:02 AM, Stephen Smalley wrote:
> On Thu, May 14, 2020 at 7:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> Create a new audit record type to contain the subject information
>> when there are multiple security modules that require such data.
>> This record is emitted before the other records for the event, but
>> is linked with the same timestamp and serial number.
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc: linux-audit@redhat.com
>> ---
> With this patch, I see userspace audit records like this one:
>
> type=SYSTEM_BOOT msg=audit(1589816792.181:103): pid=789 uid=0
> auid=4294967295 ses=4294967295 subj=? subj=system_u:system_r:init_t:s0
> msg=' comm="systemd-update-utmp"
> exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=?
> terminal=? res=success'
>
> I'm guessing that userspace is appending the second subj= field when
> it sees subj=? or otherwise is missing subj= information?

I haven't looked at the userspace code, but I expect you're right.
It looks like there will need to be some change in the userspace
for the multiple LSM case. The "completion" shown here isn't correct,
because it only fills in one of the subject attributes, not both.

> Then we have kernel audit records like this:
>
> type=PROCTITLE msg=audit(1589816791.959:101): proctitle=2F7362696E2F617564697463
> 746C002D52002F6574632F61756469742F61756469742E72756C6573
> type=SYSCALL msg=audit(1589816791.959:101): arch=c000003e syscall=44
> success=yes exit=1056 a0=3 a1=7fff9ccc98a0 a2=420 a3=0 items=0
> ppid=773 pid=783 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
> egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="auditctl"
> exe="/usr/sbin/auditctl" subj=? key=(null)
> type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> subj_selinux=system_u:system_r:unconfined_service_t:s0
> subj_apparmor==unconfined
> type=CONFIG_CHANGE msg=audit(1589816791.959:101): auid=4294967295
> ses=4294967295 subj=? op=add_rule key=(null) list=1 res=1
> type=UNKNOWN[1420] msg=audit(1589816791.959:101):
> subj_selinux=system_u:system_r:unconfined_service_t:s0
> subj_apparmor==unconfined
>
> where we are getting multiple copies of the new record type, one for
> each record type that had subj=?.

While obviously wasteful, the type=1420 behavior is consistent with
the subj=? behavior, which is to duplicate the subj= value. I know
we've got enough hobgoblins in the audit system that we don't need
to add any more in the name of a foolish consistency.

> Not sure what it is the audit folks want here.

I doubt that redundant type=1420 records are a good idea, but having
seen some of the other active threads about useless fields I am not
going to assume what is most appropriate.

> This is with multiple LSMs enabled; need to confirm that no change
> occurs if only one is enabled.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

