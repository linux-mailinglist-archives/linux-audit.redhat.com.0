Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9966B1B3
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 00:18:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8921E81F19;
	Tue, 16 Jul 2019 22:18:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD4260C44;
	Tue, 16 Jul 2019 22:18:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BE0A1800207;
	Tue, 16 Jul 2019 22:18:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GMIPt8029500 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 18:18:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F59B19C70; Tue, 16 Jul 2019 22:18:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59ABD19C68
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 22:18:23 +0000 (UTC)
Received: from sonic309-22.consmr.mail.bf2.yahoo.com
	(sonic309-22.consmr.mail.bf2.yahoo.com [74.6.129.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FCE53DE0F
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563315500; bh=LH0abjEFC7PncLzmcHW9YOD73LYtaz4VtADHcJ1vtg0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=Fb3H3iz21NlZnPo1//zydQOwxQ9alM7tfXDoAbT2HxRkGShwgGWE02FXrB6Md169vtSNSLP5jQPqy9ABR6YHW8aFpMu9nYtmMIG1iagvluIggubox3AZgszn4FLUIE/424+mnCR9dWEFDkVeZMHPEL54PgGvWvBrVZj1gDaRdQMS122ofVGpRuK4PfM6VRLN1KlKOlRzV56v5NIzxi8Q0MdFn9tywtBIIUzJc9ZyTQYCsnUZjI4F0/PKKeJQSsIqpldNzTYyQcva92n1qp3h9ik1VwZnoeqT6yYgG9TWHF8N2AujjlGzhirN44mCb7rLKWFvePztPWrmLp405t1qOg==
X-YMail-OSG: OTIsAbsVM1kdy7tR3ThiiXsXdlKJoN7XTZO5UNKkX.yjSxbF6qnVHxZJjbNbAPN
	JRnGjilaZXICdZb41YEY.4H4xHIoX2aM5cFw7dm17PuwRDbFLUMV_DHX2fyzOcHTe4vs6TLZvQVn
	JL4Q_qOEsFuR3xfo72j6Kav79OnBoVIIPRZh.pNy7MWa4XR45IgBv4ju1akLptYMeM4koOI2t5iT
	vv4tWwnSOz4gjwHzK6KJmm_BcFsixUyp9XZkrlNuMkoFQrFhZp_Q..dXobA678LwtKh34PZQj9BG
	J6fFtoav2K9HBdNHu6kK2W6NO2m1Edio6UDFoKrbyfoPQyPoaFbxXSaa2sZZ1d2nHkutMFy.sdNr
	tNc5y8BuCJLo.4ZOgV6RDSEXjN81XeyNMtJV4MtrGiQtxSAlpJGbHc8rNEMu9iyGd9U28a0ZmiXG
	JYdW29kvvJII7wZJ.n7E2oMmvB3VJrhYLQn5pIrbLd_LRSJlLVNmVvLy_eHasnAvvtl_8huYDj1h
	Zwd25tLgAMNAqOPkl.6DdDM9Xpdx8AGWsj8MytIdzNdGd_g2lvssRVDh94YDMvfITEXidj7SOJrj
	YsT9LO32tGQ8Vo7vZT3BInIQ5eTJbuYZ6iB6Y3gRniCTGOSSdugnGLsPcy3hQdvwf24zrCX1kU.C
	3r8dh6Nhq3vp4reKyHxj.CJnDt1ZUvBAQle.d9_Zh9sMKdi0x75oWqHzxs9wFu5z7.Eg0_zmtxIz
	vagJhZ5Zl0quU.6u5AETq1t.rxZb4ljdvJYtCTocYb7KdjT6YZEIcyWCdyUejRBoNI7VQHux.fC_
	S9JItWW2vr5fg4a16FvT..2qfaAtBdfmesu9AsxhK.mq2T0WSjLe58dqB3ArDcpc0pEvURyIGTTr
	cuukobi9wU7RzYepQ6vik7RQAclISlHc5vnHnUVP_mZ6X1kf9F1r4_8F5t_UqGdHnh5hlKOz6QWm
	ylx4YcrX2o0kMfpCSLY5.VUXFSP5mCedowuuExjOpF4VaVShrqtQfPLsKf1JF0TNPH2Qfzg.6i73
	plUnbuuj.xBjPjHxsuJTwOCQ1ZBGpW9rS7jJ7nq.HiIiTYuLtyoZ4k2k5LlEbMxE97By9ruFP6kc
	WXF2L5qa3UbVJ7Z_2a2bzGpcvTxOFEGqteVbbhrOyNaLesXDhAbqSuHEVRzNR7weFOdggcmBl4TL
	13_m5LBL7Y14Bw1eu21Hx3ZBAZAAuaEALwihRGFHJ3hxm017HuxZ.4Cbs9rths.REvtS5boMrvc1
	A.8mmCavMZQHR
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.bf2.yahoo.com with HTTP;
	Tue, 16 Jul 2019 22:18:20 +0000
Received: by smtp412.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 741f68405c1c2f67353b08ed9ca5cc7c; 
	Tue, 16 Jul 2019 22:18:17 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
Date: Tue, 16 Jul 2019 15:18:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2517266.eHZzEmjMsX@x2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 16 Jul 2019 22:18:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 16 Jul 2019 22:18:22 +0000 (UTC) for IP:'74.6.129.196'
	DOMAIN:'sonic309-22.consmr.mail.bf2.yahoo.com'
	HELO:'sonic309-22.consmr.mail.bf2.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 74.6.129.196 sonic309-22.consmr.mail.bf2.yahoo.com
	74.6.129.196 sonic309-22.consmr.mail.bf2.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6GMIPt8029500
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 16 Jul 2019 22:18:35 +0000 (UTC)

On 7/16/2019 2:46 PM, Steve Grubb wrote:
> On Tuesday, July 16, 2019 5:25:21 PM EDT Paul Moore wrote:
>> On Tue, Jul 16, 2019 at 2:41 PM Casey Schaufler <casey@schaufler-ca.com> 
> wrote:
>>> On 7/16/2019 11:06 AM, Steve Grubb wrote:
>>>> On Tuesday, July 16, 2019 1:43:18 PM EDT Paul Moore wrote:
>>>>> On Tue, Jul 16, 2019 at 1:30 PM Casey Schaufler
>>>>> <casey@schaufler-ca.com>
>>>> wrote:
>>>>>> On 7/16/2019 10:12 AM, Paul Moore wrote:
>>>>>>> On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> 
> wrote:
>>>>>>>> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
>>>>>>>>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler
>>>>>>>>> <casey@schaufler-ca.com>
>>>>>>>> wrote:
>>>>>>>>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
>>>>>>>>>>> On 2019-07-13 11:08, Steve Grubb wrote:
>>>>>>> ...
>>>>>>>
>>>>>>>>>>> Steve's answer is the obvious one, ideally allocating a seperate
>>>>>>>>>>> range
>>>>>>>>>>> to each LSM with each message type having its own well defined
>>>>>>>>>>> format.
>>>>>>>>>> It doesn't address the issue of success records, or records
>>>>>>>>>> generated outside the security modules.
>>>>>>>>> Yes, exactly.  The individual LSM will presumably will continue to
>>>>>>>>> generate their own audit records as they do today and I would
>>>>>>>>> imagine
>>>>>>>>> that the subject and object fields could remain as they do today
>>>>>>>>> for
>>>>>>>>> the LSM specific records.
>>>>>>>>>
>>>>>>>>> The trick is the other records which are not LSM specific but
>>>>>>>>> still
>>>>>>>>> want to include subject and/or object information.  Unfortunately
>>>>>>>>> we
>>>>>>>>> are stuck with some tough limitations given the current audit
>>>>>>>>> record
>>>>>>>>> format and Steve's audit userspace tools;
>>>>>>>> Not really. We just need to approach the problem thinking about how
>>>>>>>> to
>>>>>>>> make it work based on how things currently work.
>>>>>>> I suppose it is all somewhat "subjective" - bad joke fully intended
>>>>>>> :)
>>>>>>> - with respect to what one considers good/bad/limiting.  My personal
>>>>>>> view is that an ideal solution would allow for multiple independent
>>>>>>> subj/obj labels without having to multiplex on a single subj/obj
>>>>>>> field.  My gut feeling is that this would confuse your tools, yes?
>>>>>>>
>>>>>>>> For example Casey had a list of possible formats. Like this one:
>>>>>>>>
>>>>>>>> Option 3:
>>>>>>>>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
>>>>>>>>
>>>>>>>> I'd suggest something almost like that. The first field could be a
>>>>>>>> map
>>>>>>>> to
>>>>>>>> decipher the labels. Then we could have a comma separated list of
>>>>>>>> labels.
>>>>>>>>
>>>>>>>> lsms=selinux,apparmor subj=x:y:z:s:c,a
>>>>>>> Some quick comments:
>>>>>>>
>>>>>>> * My usual reminder that new fields for existing audit records must
>>>>>>> be
>>>>>>> added to the end of the record.
>>>>>>>
>>>>>>> * If we are going to multiplex the labels on a single field (more on
>>>>>>> that below) I might suggest using "subj_lsms" instead of "lsms" so
>>>>>>> we
>>>>>>> leave ourself some wiggle room in the future.
>>>>>>>
>>>>>>> * Multiplexing on a single "subj" field is going to be difficult
>>>>>>> because picking the label delimiter is going to be a pain.  For
>>>>>>> example, in the example above a comma is used, which at the very
>>>>>>> least
>>>>>>> is a valid part of a SELinux label and I suspect for Smack as well
>>>>>>> (I'm not sure about the other LSMs).  I suspect the only way to
>>>>>>> parse
>>>>>>> out the component labels would be to have knowledge of the LSMs in
>>>>>>> use, as well as the policies loaded at the time the audit record was
>>>>>>> generated.
>>>>>>>
>>>>>>> This may be a faulty assumption, but assuming your tools will fall
>>>>>>> over if they see multiple "subj" fields, could we do something like
>>>>>>>
>>>>>>> the following (something between option #2 and #3):
>>>>>>>   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
>>>>>>>
>>>>>>> subj2=<selinux_label> ...
>>>>>> If it's not a subj= field why use the indirection?
>>>>>>
>>>>>>         subj_smack=<smack_label> subj_selinux=<selinux_label>
>>>>>>
>>>>>> would be easier.
>>>>> Good point, that looks reasonable to me.
>>>> But doing something like this will totally break all parsers. To be
>>>> honest, I don't know if I'll ever see more than one labeled security
>>>> system running at the same time. And this would be a big penalty to
>>>> pay for the flexibility that someone, somewhere just might possibly do
>>>> this.
>>> While I have never seen multiple-LSM plans from RedHat/IBM I
>>> have seen them from Ubuntu. This isn't hypothetical. I know that
>>> it's a hard problem, which is why we need to get it as right as
>>> possible.
>> Agreed.  While I'm not going to be on a specific Linux release, I do
>> believe that at some point in the future the LSM stacking work is
>> going to land in Linus' tree.  Perhaps you'll never see it Steve, but
>> we need to prepare the code to handle it when it happens.
> And I agree with that. I'm saying that if we push it all in subj= then it is 
> not a big penalty. It saves major breakage. Every single event is required to 
> have a subj= field if its a MAC system. By changing it to lsm_subj= it changes 
> the layout of every single event. And it make more to parse. And searching 
> the labels is worse because it has to iterate over a list of *_subj to match 
> it. This will hurt performance because it is for every single event.
>
>> For my own sanity, here is a quick summary of the constraints as I
>> currently see them, please feel free to add/disagree:
>>
>> * We can't have multiple "subj" fields in a single audit record.
>> * The different LSMs all have different label formats and allowed
>> characters.  Further, a given label format may not be unique for a
>> given LSM; for example, Smack could be configured with a subset of
>> SELinux labels.
>> * Steve's audit tools appear to require a "subj" and "obj" fields for
>> LSM information or else they break into tiny little pieces.
> It changes all knowledge of where to look for things. And considering 
> considering that events could be aggregated from systems of different ages/
> distributions, audit userspace will always have to be backwards compatible.
>  
>> What if we preserved the existing subj/obj fields in the case where
>> there is only one "major" LSM (SELinux, Smack, AppArmor, etc.):
>>
>>   subj=<lsm_label>
>>
>> ... and in the case of multiple major LSMs we set the subj value to
>> "?" and introduce new subj_X fields (as necessary) as discussed above:
>>
>>   subj=? subj_smack=<smack_label> subj_selinux=<selinux_label> ...
>>
>> ... I believe that Steve's old/existing userspace tools would simply
>> report "?"/unknown LSM credentials where new multi-LSM tools could
>> report the multiple different labels. 
> Common Criteria as well as other standards require subject labels to be 
> searchable. So, changing behavior based on how many modules will still cause 
> problems with performance because I'll always have to assume it could be 
> either way and try both.
>
>> While this may not be perfect,
>> it avoids having to multiplex the different labels into a single field
>> (which is a big win IMHO) with the only issue being that multi-LSM
>> solutions will need an updated audit toolset to see the new labels
>> (which seems like a reasonable requirement).
> Why would not multiplexing different labels in the same field be a big win? Its 
> a big loss in my mind. Using the same field preserves backward compatibility, 
> is more compact in bytes, creates performance problems, changes all mapping 
> of what things means, etc. IOW, this makes things much worse.

It sounds as if some variant of the Hideous format:

	subj=selinux='a:b:c:d',apparmor='z'
	subj=selinux/a:b:c:d/apparmor/z
	subj=(selinux)a:b:c:d/(apparmor)z

would meet Steve's searchability requirements, but with significant
parsing performance penalties. 

>
> -Steve
>
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
