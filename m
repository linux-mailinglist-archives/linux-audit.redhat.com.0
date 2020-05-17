Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B131F1D6BB7
	for <lists+linux-audit@lfdr.de>; Sun, 17 May 2020 20:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589740041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=9Ex/4+9/ptLFhCXhsb0QwNDLxhFOG2EqxoV3FfyH+lg=;
	b=g6zQMVES7XAwM8zCSyzJZUa4snoPJbbYwj5jbW6M5MNGHexqbCO0R1IEmfotSkvD42T6q7
	HPcLBZMd4rEctro+neIrwm1wBmg2u/QdgE6FRMJjgJZFG5IJO5SGP1j75mMuvga9YafeZ9
	opcRgRRfrnxhATEPc/5J8BoksheENdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-CXvQfYPAPCiFhXucICJDLg-1; Sun, 17 May 2020 14:27:19 -0400
X-MC-Unique: CXvQfYPAPCiFhXucICJDLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A457B87307A;
	Sun, 17 May 2020 18:26:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F20B5D9D7;
	Sun, 17 May 2020 18:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 474E74EA24;
	Sun, 17 May 2020 18:26:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04HIPvZO009238 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 May 2020 14:25:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 565562EFA1; Sun, 17 May 2020 18:25:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519852EFA2
	for <linux-audit@redhat.com>; Sun, 17 May 2020 18:25:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5206F1859160
	for <linux-audit@redhat.com>; Sun, 17 May 2020 18:25:55 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-156-k2Nb0vvHNYio6lNkvlYFQQ-1;
	Sun, 17 May 2020 14:25:52 -0400
X-MC-Unique: k2Nb0vvHNYio6lNkvlYFQQ-1
X-YMail-OSG: GDLCK14VM1n93YP2LajsytBYm0qxYtD1SjQcgaXRWsZHrmlv4xzeQDSkn2F_fd2
	HGrmEK1A6DTnup4xQmdMOTQgc4PgHTBnuZySUx6YnATzIY3sDLwcuh5bG1259kucD5QNSdw9dA9P
	Bv8uh.SmyP_hncPu8ebuaKuvycQl7eJC4YM0daWLfwalvMJOyPXh79y_wwVvxI4DfOOmDHvXa.on
	louwxoY0uMQX2s9tWkExkthZ6MlDaiuRCF8GtMyJY7XSsFce0jlFllfNGUkJNkytx_nv0nOYkLnz
	RC1qwg.lGY5BewvogPcIhinrD8c8K8m2ZNLoa4iZZnJDy1me598vKm4UhPWn.w9gVf199pC4k7eG
	.Sx1cOx2gAQTZ2mu0tfNtxsHKTp8.OyELXShzcTBTSLjEGa4Fn8xFognWfLX7MsxgCF4bq6JcvET
	YJ5QJIfI36AJfe8.2tQIkRkixebxQd2aYS5Ab7AHMGj.r3X4W6bmj5B9wWpzzfa7dgw2es.2BhP1
	pCBrlSAiCNrmDPIdSfH6fjJpz1G_DJjvr9Z0IWHIlIialLmCM1QDNkOBLC.LhQq0xQcJGYrRig0a
	mDjaMrdL.7rJkT79.W28H1XvOWTCklMi7hyIj5Bf6KHZFCg4AbrB6LuyS71X5QKyIfIiivzqgJOm
	fS_o1fislzzd24P7zbnqlMHLsPqbzzEglb3bxP7wYAnFJd3kdkXv11XnqOPYIj5HLAGSJVPCzkvB
	1.HUmfB0EDBgi4iLWKPGzHkT3vfWSe4BMa9PU44x.YBQC98QIhxHbfJSito3MWf1PeNpKD5yCLsq
	daaTgGeVaGryZqrPkMy8vaXgLOm5V7s0EJXe4OT0cKUCiMk7MqffHwr1UMfME3mzEGr0y3FsYi3h
	jwAXlsiIN5kCmHWICfn9Zf_P1iiGv4Ze7LkEsFIpCz56DyajmbzwUDmynOk4Bg91vshs2iO_ZLrm
	9n5R5kLVkkpG095uEfsofoQadhOACil7I.EtkuL7XlajIrPyPPsOo7CZaVLmK2EcnTnjPd8NH1bV
	AhwYMiKc8Zb23He41_4OctNCH9BfjfsJq3ntQC5BHr0ObkNUoIabh47pB4r8d2ncHMiBJI4fdfwc
	LF50JSYNELNnJ.u5qZ6A3nPpGCgelc2KHKBk7O.dR2YTlGMlOwunqCvQ.eny8YQqeN9mqLJGxWqL
	uVdMUXQ4WCJEI_nznom1myMUkt7.V9Aeii7EARCtapDQ3E94CpxmzHl1AOTqCbp19V.MIQcNpCoT
	ARyZTyyZwGjg.MHgAEvtteM9y29Y6Q84_mHTSSJ095Mil6vROEssNgJROajUMyimWJn09WG44IV7
	0gpwd4I2qEVXnY3zGeqnvC7xqXkxT1ix7gMSYJ4u5A7hH7Axhw840l8kV2ofHBlzPkILBmh83w80
	e4dXtgWqf_DkX
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Sun, 17 May 2020 18:25:51 +0000
Received: by smtp402.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID b4ccef4d844bd5d33d0f1e07296b5b9d; 
	Sun, 17 May 2020 18:25:46 +0000 (UTC)
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: linux-audit@redhat.com
References: <cover.1587500467.git.rgb@redhat.com>
	<b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <e536047e-f08d-ba1e-32eb-738772ad42c4@schaufler-ca.com>
Date: Sun, 17 May 2020 11:25:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04HIPvZO009238
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/17/2020 7:15 AM, Richard Guy Briggs wrote:
> On 2020-04-28 18:25, Paul Moore wrote:
>> On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>>> Some table unregister actions seem to be initiated by the kernel to
>>> garbage collect unused tables that are not initiated by any userspace
>>> actions.  It was found to be necessary to add the subject credentials to
>>> cover this case to reveal the source of these actions.  A sample record:
>>>
>>>   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
>> [I'm going to comment up here instead of in the code because it is a
>> bit easier for everyone to see what the actual impact might be on the
>> records.]
>>
>> Steve wants subject info in this case, okay, but let's try to trim out
>> some of the fields which simply don't make sense in this record; I'm
>> thinking of fields that are unset/empty in the kernel case and are
>> duplicates of other records in the userspace/syscall case.  I think
>> that means we can drop "tty", "ses", "comm", and "exe" ... yes?
>>
>> While "auid" is a potential target for removal based on the
>> dup-or-unset criteria, I think it falls under Steve's request for
>> subject info here, even if it is garbage in this case.
> Can you explain why auid falls under this criteria but ses does not if
> both are unset?  If auid is unset then we know ses is unset?  If subj
> contains *:kernel_t:* then uid can also be dropped even though it is
> set, no?

That's going to be up to the security module. SELinux may know that a
task with a subj= *:kernel_t:* doesn't need an uid, but that's not
going to be true with Smack, or if in the (distant?) future you
have both SELinux and Smack. Creating a way for the security module
to inform the audit system that it believes fields are unnecessary
sounds tricky. Not to mention that it's likely to create cases where
the audit user-space has to know which, if any, security modules are
active.

>  I figure if we are going to start dropping fields, might as
> well drop enough to make it worth the effort, even though this is a rare
> event.
>
> As for searchability, I have solved that easily in the parser.
>
>>> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>>> ---
>>>  kernel/auditsc.c | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>>> index d281c18d1771..d7a45b181be0 100644
>>> --- a/kernel/auditsc.c
>>> +++ b/kernel/auditsc.c
>>> @@ -2557,12 +2557,30 @@ void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
>>>                        enum audit_nfcfgop op)
>>>  {
>>>         struct audit_buffer *ab;
>>> +       const struct cred *cred;
>>> +       struct tty_struct *tty;
>>> +       char comm[sizeof(current->comm)];
>>>
>>>         ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_NETFILTER_CFG);
>>>         if (!ab)
>>>                 return;
>>>         audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
>>>                          name, af, nentries, audit_nfcfgs[op].s);
>>> +
>>> +       cred = current_cred();
>>> +       tty = audit_get_tty();
>>> +       audit_log_format(ab, " pid=%u uid=%u auid=%u tty=%s ses=%u",
>>> +                        task_pid_nr(current),
>>> +                        from_kuid(&init_user_ns, cred->uid),
>>> +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
>>> +                        tty ? tty_name(tty) : "(none)",
>>> +                        audit_get_sessionid(current));
>>> +       audit_put_tty(tty);
>>> +       audit_log_task_context(ab); /* subj= */
>>> +       audit_log_format(ab, " comm=");
>>> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
>>> +       audit_log_d_path_exe(ab, current->mm); /* exe= */
>>> +
>>>         audit_log_end(ab);
>>>  }
>>>  EXPORT_SYMBOL_GPL(__audit_log_nfcfg);
>> paul moore
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

