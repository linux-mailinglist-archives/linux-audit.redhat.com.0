Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFED17EC62
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 00:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583794928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=KJfU3EwWG2MEw3BekDv66ku5RAc/WqArMW99pJVuM1s=;
	b=OqUjKdXqwMjct/8A/y4hinJ3k4IxePKuYvWFhKc89ZvDnz1cPwa+mDScA5Ei+pHZ5Ht3tV
	jDO6F2ycyKBMiSpekGbggnWzdRMIRO99xHBweavW7Bn2xLEdwfCfhEgixdsFVGsb5dQZaP
	i3lD4Y4CwtsUONjf85UN9nFeYoDNNZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-gIexrW_QOn2Wk3CNPdJWlA-1; Mon, 09 Mar 2020 19:02:05 -0400
X-MC-Unique: gIexrW_QOn2Wk3CNPdJWlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8428801E53;
	Mon,  9 Mar 2020 23:02:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7DA60C05;
	Mon,  9 Mar 2020 23:01:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7BA318089C8;
	Mon,  9 Mar 2020 23:01:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029N1fiq000554 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 19:01:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFE8D202A942; Mon,  9 Mar 2020 23:01:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9672026D67
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:01:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05005800294
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:01:39 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-348-aj30uKSHOvmbeN7SYS8lMA-1;
	Mon, 09 Mar 2020 19:01:36 -0400
X-MC-Unique: aj30uKSHOvmbeN7SYS8lMA-1
X-YMail-OSG: 7tQx4y8VM1kBb.gD0O8zVzkOAGToxsgxJQTkoRR0YWQHebJEKFmRJG9TjOgmVVx
	HYBwygxMjOHqjo5bZvscSaVXzdxzwqRo2O0sf9rMvwmZTazIx0q0C5wqW8drurRH9d_rndM3T3t0
	R8lwPMv1ki_CFQxg.1q7AGSbq17y9Pp4dNqEIldXDhq3PU_4DkygClJ4KQs2_LxXegj2i_3eZonI
	G6lUyMgOV_smFDlE.i5iR1XtPJSeOuPpshWT.5U22zo2QRBVJvKF1lz3SGlNeBzA9yiJp4qocyYB
	HgcSibQCtncJAE5fPdYDmUWtwjKS40ijES5gddSfk82dNKDDr9qJOGSvHQ9k0Ibz1lJJLZZCqP1S
	v_f7Ml9lAxdL1Lcm5i5FL5f4ghII4JSSaKixMfeVlqXXlYb5i.QjC7ta.EbZ_bz9vwZcEhG8Pjxe
	ffhuPfgQ5ZtBo.pab_g3Lqe91yX90LC7AWt2HaXBA09Mi5Gpl_OYgHJkYFAOQ7RQWMbIuiyyqk0E
	JA8OA47mqhA.NX8AlKvfucBVBMraO9YcPmvFTUlrC.ikXq6vruSkmi45zhHeb6WFl6siZUr7VNF9
	pxAKIZkVeHQS5HrgWtX3UaHjhwcXWXCf57yLse.qzHoDA4yxRnSmy_el0qC3utaVK5Sd7adyNLrO
	0O0VWjdNUTI0Gvjt2o9KarTBFfj_mtBq2V9CMgO22VenFwG_D2hsivNm8FlpTog2zH9gsDnR6SvA
	mmcZCxiC3M86jgs0kwDM69sSaANkY7JEz2bz.WH33Cc5GEwhkdiha59VJBdsNrN1FCt8XuPEuNIb
	5D5AUNcRJAzr38dDr9YpKC_RGFFZbE4_0mjlM0Qhkk4TbzKqTUya3ARcwXhSOv.rtUyOVPV3uWzJ
	6SyNy0cR2QwHF6JO2AMPoH3QxOnqlCCtXm7epNsN.P40laMy5Phb.Es1G1F8pfhnkODRj233OZmb
	cM7xwpHvqzghHGafwN6MKOJjzKFZU5csrM42qy.R5KJXDm92B5H6o6EjGkxhNcU4t9rcEVQCU4Dq
	JtlHnJ4bhbba1Uh7MCHIIUoQQWCQziDdol3OCsG7HKuIXVwIwaekt8g247fxxo2jiFaQV90T3Bdm
	RHY.8ZsR72nOBKEhJ7yq90HvuCpG3jB8E.9Xy1Ll8NgpJ.mhC8T8uRJ6egk2aR3FnIYvvo4k4F1f
	g1JZPndcEdVuna7OYD9lVI8r3ppWU2kPVLhDhagq2UJLA8C809ybcShKtZYZ_gsdlb46GBth7w0c
	ZqV2Ww8uVlP0pzPoq9N15v0favFi6WHF19jEk88UNantUXbRQh5voaJeeytQpHsLc4x.58g3O7HV
	PREGovaajIR3cJD8l5nNMS9KvqVKpoIkoKS7kKErFWhLKRNvQt0SEiqOeIz8Qnw3ZtGqdzdrreJ2
	Rv1yqUFT7A.gLrCQsIDWFJ.CNc17G5hccxogP
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 9 Mar 2020 23:01:35 +0000
Received: by smtp401.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 164d1240e7df39ba4ee22f50235315e0; 
	Mon, 09 Mar 2020 23:01:34 +0000 (UTC)
Subject: Re: [PATCH v15 21/23] Audit: Include object data for all security
	modules
To: Paul Moore <paul@paul-moore.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-14-casey@schaufler-ca.com>
	<CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
	<42b3a4f0-c6ee-516a-7d10-726222c42b78@schaufler-ca.com>
	<CAHC9VhRiqHAJLBNLxLrFHsevSdV0bG_P_YFWV6Kw00ZGTKduHw@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <c05f3146-ae38-51bc-c5dc-cc4e21ba8447@schaufler-ca.com>
Date: Mon, 9 Mar 2020 16:01:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRiqHAJLBNLxLrFHsevSdV0bG_P_YFWV6Kw00ZGTKduHw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029N1fiq000554
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/9/2020 10:59 AM, Paul Moore wrote:
> On Mon, Mar 9, 2020 at 1:45 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 3/6/2020 6:31 PM, Paul Moore wrote:
>>> Either way, the "obj=" field should stay where it is, but the
>>> "obj_XXX=" fields need to find their way to the end of the record.
>> As Steve pointed out, there may be a bigger issue here. If the additional
>> fields aren't going to fit in MAX_AUDIT_MESSAGE_LENGTH bytes another
>> format may be required. I had hoped that perhaps obj_selinux= might count
>> as a refinement to obj= and hence not be considered a new field, but
>> it looks like that's not flying.
> Regardless, the field placement guidance remains the same.

I hear that clearly. End of record.


> As far as the record limitation; yes, Steve's audit userspace does
> have a limit, but I do wonder how limiting an 8k record size really is
> for the majority of systems.  My guess is "not too bad".

Two large path names would be the only worrisome case.
It seems that adding multiple labels will rarely be an issue in
practice, but if we can avoid the difference between theory and
practice we'll be ahead.

> If you are
> concerned about that, I imagine you could always tack on a new record
> to relevant events with additional LSM subj/obj info.

This seems safest, if doing so would be allowed.

>   Some of the
> audit container ID pre-work have made that less painful than it would
> have been in the past, but it will still be a bit of work to get it
> right.

I'd rather put the work in up front than try to fight over whether
records potentially getting too big violates the "don't break user-space"
rules.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

